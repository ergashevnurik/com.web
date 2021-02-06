package com.Controllers;

import com.Domain.MySubjects;
import com.Repos.MySubjectsRepo;
import com.Services.MySubjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class MySubjectsController {

    @Value("${upload.path}")
    private String uploadPath;

    private final MySubjectsRepo mySubjectsRepo;

    @Autowired
    public MySubjectsController(MySubjectsRepo mySubjectsRepo) {
        this.mySubjectsRepo = mySubjectsRepo;
    }

    @Autowired
    private MySubjectsService mySubjectsService;

    @RequestMapping(value = "/mySubjects", method = RequestMethod.GET)
    public String getInitialView(Model model) {

        Page page = mySubjectsService.listAll();
        long totalElements = page.getTotalElements();
        List<MySubjects> mySubjectsList = page.getContent();

        model.addAttribute("messages", mySubjectsRepo.findAll());

        return "mySubjects";
    }

    @RequestMapping(value = "/add-mySubject", method = RequestMethod.POST)
    public String add(@RequestParam String url, @RequestParam String title,
                      @RequestParam("file") MultipartFile file, Model model) throws IOException {

        MySubjects mySubjects = new MySubjects(title, url);
        String newUrl = "";
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File fileDir = new File(uploadPath);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            String uuidFileName = UUID.randomUUID().toString();
            String resultUuidFileName = uuidFileName + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultUuidFileName));
        }

        if (url != null && !url.isEmpty()) {
            newUrl = "/mySubject";
        }
        mySubjects.setUrl(newUrl);

        mySubjectsRepo.save(mySubjects);

        model.addAttribute("messages", mySubjectsRepo.findAll());

        return "mySubjects";
    }

}
