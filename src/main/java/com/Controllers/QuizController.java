package com.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/quiz/")
public class QuizController {

    @GetMapping("/")
    private String getInitView() {
        return "training";
    }

}
