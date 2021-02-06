package com.Controllers;

import com.Domain.Lesson;
import com.Repos.LessonRepo;
import com.Services.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class LessonController {

    @Autowired
    private LessonRepo lessonRepo;

    @Value("${upload.path}")
    public String uploadPath;

    private final LessonService lessonService;

    @Autowired
    public LessonController(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @RequestMapping(value = "/lessonView/{lessonView}", method = RequestMethod.GET)
    public String getView(@PathVariable Lesson lessonView, Model model) {
        model.addAttribute("lessonView", lessonView);
        model.addAttribute("title", lessonView.getTitle());
        model.addAttribute("description", lessonView.getDescription());
        model.addAttribute("filename", lessonView.getFilename());
        model.addAttribute("message", "Welcome To Lesson");
        return "lessonView";
    }

    @RequestMapping(value = "/lessonTable", method = RequestMethod.GET)
    public String getTable(Model model) {
        model.addAttribute("message", "Welcome To Table");
        model.addAttribute("messages", lessonService.findAll());
        return getPaginationAndSorting(1, model);
    }

    @RequestMapping(value = "/delete-lesson/{id}", method = {RequestMethod.GET, RequestMethod.DELETE})
    public String deleteLesson(@PathVariable Long id) {
        lessonService.deleteLessonById(id);
        return "redirect:/lessonTable";
    }

    @RequestMapping(value = "/update-lesson/{lesson}", method = {RequestMethod.GET})
    public String updateLessonById(@PathVariable Lesson lesson, Model model) {
        model.addAttribute("title", lesson.getTitle());
        model.addAttribute("description", lesson.getDescription());
        model.addAttribute("filename", lesson.getFilename());
        return "lessonForm";
    }

    @RequestMapping(value = "/add-lesson", method = RequestMethod.GET)
    public String getForm(Model model) {
        model.addAttribute("message", "Add New Lesson");
        return "lessonForm";
    }

    @RequestMapping(value = "/lessonTable/{pageNumber}", method = RequestMethod.GET)
    public String getPaginationAndSorting(@PathVariable("pageNumber") int currentPage, Model model) {
        Page<Lesson> page = lessonService.listAll(currentPage);
        int totalPages = page.getTotalPages();
        long totalElements = page.getTotalElements();
        List<Lesson> list = page.getContent();

        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("messages", lessonRepo.findAll());

        return "lessonTable";
    }

    // Add-Lesson In lessonForm with POST METHOD

    @RequestMapping(value = "/add-lesson", method = RequestMethod.POST)
    public String addLesson(@RequestParam String title, @RequestParam String description,
                            @RequestParam("file") MultipartFile file, Model model) throws IOException {

        Lesson lesson = new Lesson(title, description);

        if (file != null) {

           java.io.File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFilename = UUID.randomUUID().toString();
            String resultFilename = uuidFilename + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            lesson.setFilename(resultFilename);

        }

        lessonRepo.save(lesson);
        model.addAttribute("messages", lessonRepo.findAll());

        return "redirect:/lessonTable";
    }

}
