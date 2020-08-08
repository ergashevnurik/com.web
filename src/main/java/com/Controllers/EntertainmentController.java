package com.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/entertainment")
public class EntertainmentController {

    @GetMapping
    public String getInitialView(Model model) {

        return "entertainment";
    }

}
