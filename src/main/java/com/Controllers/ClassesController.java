package com.Controllers;

import com.Domain.EdsClasses;
import com.Repos.ClassesRepo;
import com.Services.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    @Autowired
    private ClassesRepo classesRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/classes")
    public String getView(Model model) {
        model.addAttribute("infos", classesService.findAll());
        return "classes";
    }

    @PostMapping("/classes")
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
        model.addAttribute("infos", messages);

        return "classes";
    }


}
