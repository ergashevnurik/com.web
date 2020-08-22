package com.telegramBot;

import com.vdurmont.emoji.EmojiParser;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendDocument;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.methods.send.SendPhoto;
import org.telegram.telegrambots.meta.api.methods.send.SendPhoto;
import org.telegram.telegrambots.meta.api.objects.*;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.ReplyKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardRow;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.io.IOException;
import java.security.Key;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class TelegramBotController extends TelegramLongPollingBot {

    private final String BOT_USERNAME = "MENZcompany_bot";
    private final String BOT_TOKEN = "710487044:AAE1g-UCvoY_ACJ410QUFNlYxJZRJm4WUbE";

    private void log(String firstName, String lastName, String userId, String text, String bot_answer) {
        System.out.println("\n-----------------------------------------");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        System.out.println(dateFormat.format(date));
        System.out.print("Message From " + firstName + " " + lastName + " " + ". (id = " + userId + ") " + "\n Text " + text);
        System.out.println("\nBot Answer: Text - " + bot_answer);
    }

    private void initializeBot(Update update) {
        String message_text = update.getMessage().getText();
        long cht_id = update.getMessage().getChatId();
        SendMessage sendMessage = new SendMessage()
                .setText("Welcome To Our Channel")
                .setChatId(cht_id);

        if (message_text.equals("/start") || message_text.toLowerCase().equals("start")) {

            ReplyKeyboardMarkup replyKeyboardMarkup = new ReplyKeyboardMarkup();
            List<KeyboardRow> keyboardRowList = new ArrayList<>();
            KeyboardRow keyboardButtons = new KeyboardRow();

            keyboardButtons.add("O'zbek");
            keyboardButtons.add("Русский");
            keyboardButtons.add("English");

            keyboardRowList.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRowList);
            sendMessage.setReplyMarkup(replyKeyboardMarkup);

            try {
                execute(sendMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }

        }
    }

    private void repeatTheMessage(Update update) {
        String message_text = update.getMessage().getText();
        long chat_id = update.getMessage().getChatId();

        SendMessage sendMessage = new SendMessage()
                .setChatId(chat_id)
                .setText(message_text);

        try {
            execute(sendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    public static void getCurrentDate() {
        Date date = new Date();
        String dateFormat = "hh:mm:ss a";
        DateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);

        String formattedDate = simpleDateFormat.format(date);
        System.out.println("HH:MM:SS" + formattedDate);
    }

    public void sendMessageOnTime(Update update) {
        String message_tex = update.getMessage().getText();
        long chat_id = update.getMessage().getChatId();

        String firstName = update.getMessage().getChat().getFirstName();
        Date date = new Date();
        String dateFormat = "hh:mm:ss a";
        DateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
        String formattedDate = simpleDateFormat.format(date);

            SendMessage sendMessage = new SendMessage()
                    .setChatId(chat_id)
                    .setText("Hi " + firstName + " " + formattedDate);

            try {
                execute(sendMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
    }

    private void redirectTheMessage(Update update) {
        String message_text = update.getMessage().getText();
        long chat_id = update.getMessage().getChatId();

        SendMessage sendMessage = new SendMessage()
                .setText(message_text)
                .setChatId("Menz_Admin");

        try {
            execute(sendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void onUpdateReceived(Update update) {

        initializeBot(update);

        if (update.hasMessage() && update.getMessage().hasText()) {

            // First Name
            String firstName = update.getMessage().getChat().getFirstName();
            // Last Name
            String lastName = update.getMessage().getChat().getLastName();
            // User Name
            String userName = update.getMessage().getChat().getUserName();
            // User ID
            long userId = update.getMessage().getChat().getId();
            // Bot Answer
            String answer = "Getting User Information";

            log(firstName, lastName, userName, Long.toString(userId), answer);

            sendMessageOnTime(update);

        }

       /* else *//**//*if (update.hasMessage() && update.getMessage().hasPhoto()) {
            long chat_id = update.getMessage().getChatId();
            List<PhotoSize> sendPhotos = update.getMessage().getPhoto();

            //File ID
            String file_id = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getFileId();
            //File Width
            int file_width = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getWidth();
            //File Height
            int file_height = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getHeight();
            //File Caption
            String caption = "File ID: " + file_id + "\nFile Width: " + Integer.toString(file_width) + "\nFile Height " + Integer.toString(file_height);
            SendPhoto sendPhoto = new SendPhoto()
                    .setPhoto(file_id)
                    .setCaption(caption)
                    .setChatId(chat_id);
            try {
                execute(sendPhoto);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }
        String message_text = update.getMessage().getText();
        long chat_id = update.getMessage().getChatId();

        SendMessage sendMessage = new SendMessage()
                .setChatId(chat_id)
                .setText(message_text);

        if (message_text.equals("/start")) {
            ReplyKeyboardMarkup replyKeyboardMarkup = new ReplyKeyboardMarkup();
            List<KeyboardRow> keyboardRows = new ArrayList<>();
            KeyboardRow keyboardButtons = new KeyboardRow();

            keyboardButtons.add("O'zbek Tili");
            keyboardButtons.add("Русский Язык");
            keyboardButtons.add("English Language");

            keyboardRows.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRows);
            sendMessage.setReplyMarkup(replyKeyboardMarkup);

            try {
                execute(sendMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }

        }
        if (update.hasMessage() && update.getMessage().hasText()) {
            //First name
            String FirstName = update.getMessage().getChat().getFirstName();
            //Last name
            String LastName = update.getMessage().getChat().getLastName();
            //User name
            String UserName = update.getMessage().getChat().getUserName();
            //User Id
            long UserId = update.getMessage().getChat().getId();

            String message = update.getMessage().getText();
            long chatId = update.getMessage().getChatId();

            String answer = EmojiParser.parseToUnicode("\nHere is a smile emoji: :smile: " +
                    "\nHere is an alien emoji: :alien:" +
                    "\nHere is a sad emoji: :sad:");

            SendMessage send_message = new SendMessage()
                    .setChatId(chatId)
                    .setText(answer);
            log(FirstName, LastName, Long.toString(UserId), message, answer);
            try {
                execute(send_message);
            }  catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }

        if (update.hasMessage() && update.getMessage().hasDocument()) {
            long chatId = update.getMessage().getChatId();
            Document document = new Document();

            //File Id
            String file_id = document.getFileId();
            //File Size
            int file_size = document.getFileSize();
            //File Name
            String file_name = document.getFileName();

            //Caption
            String caption = "File ID " + file_id + "File name " + file_name + "File Size " + Integer.toString(file_size);

            SendMessage message = new SendMessage()
                    .setText(caption)
                    .setChatId(chatId);
            try {
                execute(message);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }*//*

        String message_text = update.getMessage().getText();
        long chat_id = update.getMessage().getChatId();

        if (message_text.equals("/start") || message_text.toLowerCase().equals("start")) {

            SendMessage sendMessage = new SendMessage()
                    .setText("Choose Appropriate Language\nВыберите Язык\nTilni Tanla")
                    .setChatId(chat_id);

            ReplyKeyboardMarkup replyKeyboardMarkup = new ReplyKeyboardMarkup();
            List<KeyboardRow> keyboardRows = new ArrayList<>();
            KeyboardRow keyboardButtons = new KeyboardRow();

            keyboardButtons.add("O'zbek Tili\uD83C\uDDFA\uD83C\uDDFF");
            keyboardButtons.add("Русский Язык\uD83C\uDDF7\uD83C\uDDFA");
            keyboardButtons.add("English Language\uD83C\uDDFA\uD83C\uDDF8");

            keyboardRows.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRows);

            keyboardButtons = new KeyboardRow();

            keyboardButtons.add("Help\uD83C\uDD98");
            keyboardButtons.add("Settings⚙");

            keyboardRows.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRows);
            sendMessage.setReplyMarkup(replyKeyboardMarkup);

            try {
                execute(sendMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }

        SendMessage message = new SendMessage()
                .setChatId(chat_id);

        if (message_text.equals("Help\uD83C\uDD98")) {
            message.setText("Hello This is a Bot That makes life easier");
        } else if (message_text.equals("Settings⚙")) {
            message.setText("Setting options let Change or Modify some Function and Problems");
        } else if (message_text.equals("O'zbek Tili\uD83C\uDDFA\uD83C\uDDFF")) {
            message.setText("Assalomu Aleykum, Hurmatli User");

            //Create Keyboard
            ReplyKeyboardMarkup replyKeyboardMarkup = new ReplyKeyboardMarkup();
            List<KeyboardRow> keyboardRows = new ArrayList<>();
            KeyboardRow keyboardButtons = new KeyboardRow();

            keyboardButtons.add("Rasmlar");
            keyboardButtons.add("Musiqalar");
            keyboardButtons.add("Documentlar");

            keyboardRows.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRows);

            keyboardButtons = new KeyboardRow();

            keyboardButtons.add("Videolar");
            keyboardButtons.add("O'rtga◀");

            keyboardRows.add(keyboardButtons);
            replyKeyboardMarkup.setKeyboard(keyboardRows);
            message.setReplyMarkup(replyKeyboardMarkup);
        }

        if (message_text.equals("Rasmlar")) {
            SendPhoto sendPhoto = new SendPhoto()
                    .setChatId(chat_id)
                    .setPhoto("")
                    .setCaption("Birinchi Rasm");
        }



        try {
            execute(message);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
        if (update.hasMessage() && update.getMessage().hasText()) {
            SendMessage sendMessage = new SendMessage()
                    .setText(message_text)
                    .setChatId(chat_id);
            try {
                execute(sendMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }

        } else if (update.hasMessage() && update.getMessage().hasPhoto()) {
            long chat_Id = update.getMessage().getChatId();
            //Send Photo
            List<PhotoSize> sendPhotos = update.getMessage().getPhoto();

            //Photo Id
            String photo_id = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getFileId();
            //Photo Width
            int photo_width = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getWidth();
            //Photo Height
            int photo_height = sendPhotos.stream()
                    .sorted(Comparator.comparing(PhotoSize::getFileSize).reversed())
                    .findFirst()
                    .orElse(null).getHeight();
            //Photo Caption
            String caption = "Photo ID: " + photo_id + "\nPhoto Width: "+ Integer.toString(photo_width) + "\nPhoto Height: " + Integer.toString(photo_height);

            SendPhoto sendPhoto = new SendPhoto()
                    .setChatId(chat_Id)
                    .setPhoto(photo_id)
                    .setCaption(caption);

            try {
                execute(sendPhoto);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }*/

    }

    @Override
    public String getBotUsername() {
        return BOT_USERNAME;
    }
    @Override
    public String getBotToken() {
        return BOT_TOKEN;
    }
}
