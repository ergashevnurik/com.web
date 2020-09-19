package com.Controllers;

import com.Config.TwilioConfig;
import com.twilio.Twilio;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TwilioController {

    private final static Logger LOGGER = LoggerFactory.getLogger(TwilioController.class);
    private final TwilioConfig twilioConfig;

    @Autowired
    public TwilioController(TwilioConfig twilioConfig) {

        this.twilioConfig = twilioConfig;

        Twilio.init(
                twilioConfig.getAccountSid(),
                twilioConfig.getAuthToken()
        );

        LOGGER.info("Twilio inits ..... with accoun sid {}", twilioConfig.getAccountSid());

    }



}
