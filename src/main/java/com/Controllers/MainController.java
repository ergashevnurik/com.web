package com.Controllers;

import com.Domain.Message;
import com.Domain.User;
import com.Repos.MessageRepo;
import com.Repos.UserRepo;
import com.Services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;
    private UserRepo userRepo;

    @Autowired
    private MessageService messageService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/greeting")
    public String greeting(Map<String, Object> model, HttpServletRequest request) {

        Locale currentLocal = request.getLocale();
        String countryCode = currentLocal.getCountry();
        String countryName = currentLocal.getDisplayCountry();

        String languageCode = currentLocal.getLanguage();
        String langName = currentLocal.getDisplayLanguage();

        System.out.println(countryCode + " " + countryName);
        System.out.println(languageCode + " " + langName);

        System.out.println("====================");

        String[] languages = Locale.getISOLanguages();

        for (String language : languages) {
            Locale locale = new Locale(language);
            System.out.println(language + " " + locale.getDisplayLanguage());
        }

        return "greeting";
    }

    @GetMapping("/main")
    public String getInitialView(Model model) {
        return main("",1, model);
    }

    @GetMapping("/main/{pageNumber}")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       @PathVariable("pageNumber") int currentPage, Model model) {
        Page<Message> message = messageService.listAll(currentPage);
        int totalPages = message.getTotalPages();
        long totalElements = message.getTotalElements();
        List<Message> list = message.getContent(); // Todo this because the getContent does not work

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("messages", list); // Todo this because the getContent does not work


        if (filter != null && !filter.isEmpty()) {
            list = messageRepo.findByTag(filter);
        } else {
            list = (List<Message>) messageRepo.findAll();
        }


        model.addAttribute("messages", list);
        model.addAttribute("filter", filter);


        return "main";
    }


    @PostMapping("/add-book")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file,
            @RequestParam("fileImg") MultipartFile fileImg
    ) throws IOException {
        message.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {

            if ((file != null && !file.getOriginalFilename().isEmpty()) && (fileImg != null && !fileImg.getOriginalFilename().isEmpty())) {

                File fileDir = new File(uploadPath);

                if (!fileDir.exists()) {
                    fileDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String uuidFileImg = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "." + file.getOriginalFilename();
                String resultFileNameImg = uuidFileImg + "." + fileImg.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFileName));
                fileImg.transferTo(new File(uploadPath + "/" + resultFileNameImg));
                message.setFilename(resultFileName);
                message.setFilenameImg(resultFileNameImg);
            }
            model.addAttribute("message", null);
            messageRepo.save(message);

        }
        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        return "redirect:/main";
    }

}