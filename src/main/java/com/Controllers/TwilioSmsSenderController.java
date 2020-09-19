package com.Controllers;

import com.Domain.SmsRequest;
import com.Services.TwilioSmsSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1/sms")
public class TwilioSmsSenderController {

    private final TwilioSmsSenderService twilioSmsSenderService;

    @Autowired
    public TwilioSmsSenderController(TwilioSmsSenderService twilioSmsSenderService) {
        this.twilioSmsSenderService = twilioSmsSenderService;
    }

    @GetMapping
    public String getInitialView() {
        return "twilioTemplate";
    }

    @PostMapping
    public void sendSms(@Valid @RequestBody SmsRequest smsRequest) {
        twilioSmsSenderService.sendSms(smsRequest);
    }

}
