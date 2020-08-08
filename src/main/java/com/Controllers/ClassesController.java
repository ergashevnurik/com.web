package com.Controllers;

import com.Domain.EdsClasses;
import com.Repos.ClassesRepo;
import com.Services.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/classes")
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    @Autowired
    private ClassesRepo classesRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String getInitialView(Model model) {

        model.addAttribute("messages", classesRepo.findAll());

        return "classesView";
    }

    @GetMapping("{classes}")
    public String getInitialView(@PathVariable EdsClasses classes, Model model) {

        model.addAttribute("classes", classes);
        model.addAttribute("infos", classesRepo.findAll());

        return "classesTable";
    }

    @PostMapping
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



}
