package com.Controllers;

import com.VaadinApplication.ProgressProcess.ui.ProgressView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProgressController {

    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    private String initView() {
        ProgressView progressView = new ProgressView();
        return "progressView";
    }

}
