package com.Controllers;

import com.Domain.EdsClasses;
import com.Exception.StorageExceptionNotFound;
import com.Repos.ClassesRepo;
import com.Repos.ClassesServiceRepo;
import com.Services.ClassesService;
import com.Services.FileSystemStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import java.awt.print.Pageable;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

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

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/classes")
    public String getInitialView(Model model) {


        return listByPage(model, 1);
    }

    @GetMapping("/page/{pageNumber}")
    public String listByPage(Model model, @PathVariable("pageNumber") int currentPage) {
        Page<EdsClasses> page = classesService.listAll(currentPage);
        long totalElements = page.getTotalElements();
        int totalPages = page.getTotalPages();
        List<EdsClasses> list = page.getContent();

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);

        model.addAttribute("messages", list);

        return "classesView";
    }

    @GetMapping("/classes/{classes}")
    public String getInitialView(@PathVariable EdsClasses classes, Model model) {

        model.addAttribute("classes", classes);
        model.addAttribute("infos", classesRepo.findAll());

        return "classesTable";
    }

    @PostMapping("classes")
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

        return "classesView";
    }

    @ExceptionHandler(StorageExceptionNotFound.class)
    public ResponseEntity<?> handleStorageFileNotFound(StorageExceptionNotFound exc) {
        return ResponseEntity.notFound().build();
    }


}
