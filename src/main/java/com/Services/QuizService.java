package com.Services;

import com.Domain.Question;

import java.util.Scanner;

public class QuizService {
    public static void main(String args[]) {

        String q1 = "What is the color of apple\n" +
                "(a).Green\n(b).Yellow\n(c).Blue";
        String q2 = "What is the color of banana\n" +
                "(a).Green\n(b).Yellow\n(c).Blue";

        Question[] questions = {
                new Question(q1, "a"),
                new Question(q2, "b")
        };

        takeTest(questions);

    }

    public static void takeTest(Question [] questions) {
        int score = 0;
        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < questions.length; i++) {
            System.out.println(questions[i].getPrompt());
            String answer = scanner.nextLine();
            if (answer.equals(questions[i].getAnswer())) {
                score++;
            }
        }
        System.out.println("You got " + score + "/" + questions.length);
    }

}
