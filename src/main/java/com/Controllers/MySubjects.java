package com.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MySubjects {

    @RequestMapping(value = "/mySubjects", method = RequestMethod.GET)
    public String getInitialView() {

        return "mySubjects";
    }

}
