package com.Domain;

public class Question {
    private String prompt;
    private String answer;

    public Question(String prompt, String answer) {
        this.answer = answer;
        this.prompt = prompt;
    }

    public String getPrompt() {
        return prompt;
    }

    public void setPrompt(String prompt) {
        this.prompt = prompt;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}