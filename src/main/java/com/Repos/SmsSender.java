package com.Repos;

import com.Domain.SmsRequest;

public interface SmsSender {
    void sendSms(SmsRequest smsRequest);
}
