package com.Controllers;

import com.Domain.AssignmentSubmission;
import com.Domain.EdsClasses;
import com.Exception.StorageExceptionNotFound;
import com.PDFExport.ClassesPdfExport;
import com.PDFExport.ClassesTablePdfExport;
import com.Repos.AssignmentSubmissionRepo;
import com.Repos.ClassesRepo;
import com.Repos.ClassesServiceRepo;
import com.Services.ClassesService;
import com.Services.FileSystemStorageService;
import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    @Autowired
    private FileSystemStorageService storageService;

    @Autowired
    private ClassesServiceRepo classesServiceRepo;

    @Autowired
    private ClassesRepo classesRepo;

    @Autowired
    private AssignmentSubmissionRepo assignmentSubmissionRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/assignment")
    public String getInitialView(Model model) {


        return listByPage(model, 1, "title", "asc");
    }

    @GetMapping("/assignment/export")
    public void exportToPDF(HttpServletResponse response) throws IOException, DocumentException {
        response.setContentType("application/pdf");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormat.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=classes_" + currentDateTime + ".pdf";

        response.setHeader(headerKey, headerValue);

        List<EdsClasses> list = (List<EdsClasses>) classesRepo.findAll();

        ClassesPdfExport classesPdfExport = new ClassesPdfExport(list);
        classesPdfExport.export(response);

    }

    @GetMapping("/assignment/exportPdfHw")
    public void exportToPDFHw(HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDate = dateFormat.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=homework_" + currentDate + ".pdf";

        response.setHeader(headerKey, headerValue);

        List<EdsClasses> list = (List<EdsClasses>) classesRepo.findAll();
        ClassesTablePdfExport classesTablePdfExport = new ClassesTablePdfExport(list);
        classesTablePdfExport.export(response);
    }

    @GetMapping("/assignment/exportCsvHw")
    public void exportToCsvHw(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDate = dateFormat.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=homework_" + currentDate + ".csv";

        response.setHeader(headerKey, headerValue);

        List<EdsClasses> classes = (List<EdsClasses>) classesRepo.findAll();
        ICsvBeanWriter csvBeanWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

        String[] csvHeader = {"ID", "Title", "Book Title", "Due Date", "Extended Date", "Status", "Submission Method", "Submission Format", "Description"};
        String[] nameMapping = {"id", "title", "bookTitle", "dueDate", "extendedDate", "status", "submissionMethod", "submissionFormat", "description"};
        csvBeanWriter.writeHeader(csvHeader);

        for (EdsClasses edsClasses : classes) {
            csvBeanWriter.write(edsClasses, nameMapping);
            csvBeanWriter.close();
        }
    }

    @GetMapping("/assignment/csv")
    public void exportToCsv(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mmm:ss");
        String currentDateTime = dateFormat.format(new Date());
        String fileName = "classes" + currentDateTime + ".csv";
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=" + fileName;

        response.setHeader(headerKey, headerValue);

        List<EdsClasses> list = (List<EdsClasses>) classesRepo.findAll();

        ICsvBeanWriter csvBeanWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

        String[] csvHeader = {"ID", "Title", "Due Date", "Extended Date", "Status", "Submission Method", "Submission Format"};
        String[] nameMapping = {"id", "title", "dueDate", "extendedDate", "status", "submissionMethod", "submissionFormat"};

        csvBeanWriter.writeHeader(csvHeader);

        for (EdsClasses edsClasses : list) {
            csvBeanWriter.write(edsClasses, nameMapping);
        }

        csvBeanWriter.close();


    }

    @GetMapping("/page/{pageNumber}")
    public String listByPage(Model model, @PathVariable("pageNumber") int currentPage,
                             @Param("sortField") String sortField,
                             @Param("sortDirection") String sortDirection) {
        Page<EdsClasses> page = classesService.listAll(currentPage, sortField, sortDirection);
        long totalElements = page.getTotalElements();
        int totalPages = page.getTotalPages();
        List<EdsClasses> list = page.getContent();

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);

        model.addAttribute("messages", list);

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDirection", sortDirection);

        String reverseSortDirection = sortDirection.equals("asc") ? "desc" : "asc";
        model.addAttribute("reverseSortDirection", reverseSortDirection);

        return "assignmentView";
    }

    @GetMapping("/assignment/{assignment}")
    public String getInitialView(@PathVariable EdsClasses assignment, Model model) {

        model.addAttribute("assignment", assignment);
        model.addAttribute("id", assignment.getId());
        model.addAttribute("title", assignment.getTitle());
        model.addAttribute("bookTitle", assignment.getBookTitle());
        model.addAttribute("dueDate", assignment.getDueDate());
        model.addAttribute("extendedDate", assignment.getExtendedDate());
        model.addAttribute("submissionMethod", assignment.getSubmissionFormat());
        model.addAttribute("status", assignment.getStatus());
        model.addAttribute("submissionFormat", assignment.getSubmissionFormat());
        model.addAttribute("description", assignment.getDescription());
        model.addAttribute("filename", assignment.getFilename());

        return "assignmentTable";
    }

    @RequestMapping(value = "/add-assignment", method = RequestMethod.GET)
    public String getInitialView() {
        return "assignmentForm";
    }

    @PostMapping("/submit-assignment")
    public String submitAssignment(@RequestParam String assignmentTitle,
                                   @RequestParam("assignmentFile") MultipartFile assignmentFile,
                                   @RequestParam String assignmentDescription, Model model) throws IOException {
        AssignmentSubmission assignmentSubmission = new AssignmentSubmission(assignmentTitle, assignmentDescription);

        if (assignmentFile != null) {

            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFilename = UUID.randomUUID().toString();
            String resultFilename = uuidFilename + "." + assignmentFile.getOriginalFilename();
            assignmentFile.transferTo(new File(uploadPath + "/" + resultFilename));
            assignmentSubmission.setAssignmentFileName(resultFilename);
        }

        assignmentSubmissionRepo.save(assignmentSubmission);

        model.addAttribute("assignmentTitle", assignmentSubmission.getAssignmentTitle());
        model.addAttribute("assignmentDescription", assignmentSubmission.getAssignmentDescription());
        return "assignmentTable";
    }

    @PostMapping("/add-assignment")
    public String add(@RequestParam String title, @RequestParam String bookTitle,
                      @RequestParam String description, @RequestParam Integer extendedDate,
                      @RequestParam Integer dueDate, @RequestParam String submissionMethod,
                      @RequestParam String status, @RequestParam String submissionFormat, Model model,
            @RequestParam("file") MultipartFile file) throws IOException {

        EdsClasses edsClasses = new EdsClasses(title, bookTitle, description, extendedDate, dueDate, submissionMethod, status, submissionFormat);

        if (file != null) {

            File uploadDir = new File(uploadPath);

                if(!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

            String uuidFilename = UUID.randomUUID().toString();
            String resultFilename = uuidFilename + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            edsClasses.setFilename(resultFilename);
        }

        classesRepo.save(edsClasses);
        Iterable<EdsClasses> messages = classesService.findAll();

        model.addAttribute("messages", messages);

        return "redirect:/assignment";
    }

    @ExceptionHandler(StorageExceptionNotFound.class)
    public ResponseEntity<?> handleStorageFileNotFound(StorageExceptionNotFound exc) {
        return ResponseEntity.notFound().build();
    }

    @RequestMapping(value = "/delete-assignment/(edsClasses)", method = RequestMethod.GET)
    public String deleteAssignment(@PathVariable EdsClasses edsClasses, Model model) {
        classesRepo.deleteByTitle(edsClasses.getTitle());
        model.addAttribute("id", edsClasses);
        return "redirect:/assignment";
    }

}
