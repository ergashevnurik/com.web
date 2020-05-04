package com.telegramBot;

import org.telegram.telegrambots.ApiContextInitializer;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.meta.exceptions.TelegramApiRequestException;

public class TelegramBotInitializer {
    public static void main(String[] args) {
        ApiContextInitializer.init();
        TelegramBotsApi botsApi = new TelegramBotsApi();

            try {
                botsApi.registerBot(new TelegramBotController());
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
            System.out.println("It was Successfully Started");
    }
}
