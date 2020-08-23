package com.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EntertainmentController {

    @RequestMapping(value = "/entertainment", method = RequestMethod.GET)
    public String getInitialView(Model model) {

        return "entertainment";
    }

    @RequestMapping(value = "/add-card", method = RequestMethod.POST)
    public String addCard(Model model) {



        return "entertainment";
    }

}
