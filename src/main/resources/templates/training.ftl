<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">


<@c.page>

    <section id="quiz_section">
        <div class="container">
            <!-- Start Quiz Button -->
            <div class="start_btn">
                <button type="submit">Start Quiz</button>
            </div>
            <!-- Info Box -->
            <div class="info_box">
                <div class="info_title">
                    <span>Some Rules of this Quiz</span>
                </div>
                <div class="info_list">
                    <div class="info">
                       1. Don't Cheat
                    </div>
                    <div class="info">
                       2. Choose Only One option
                    </div>
                    <div class="info">
                       3. Get Results
                    </div>
                </div>
                <div class="buttons">
                    <button class="quit">Exit Quiz</button>
                    <button class="restart">Continue</button>
                </div>
            </div>

            <!-- Quiz Box Goes here -->
                <div class="quiz_box">
                    <header>
                        <div class="title">Awesome Quiz Application</div>
                        <div class="timer">
                            <div class="time_text">Time Left</div>
                            <div class="timer_sec">15</div>
                        </div>
                        <div class="time_line"></div>
                    </header>
                    <section>
                        <div class="que_text">
                            <#--<span>What does HTML stand for?</span>-->
                        </div>
                        <div class="option_list">
                            <#--<div class="option">
                                <span>Hyper Text</span>
                                <div class="icon tick">
                                    <i class="fas fa-check"></i>
                                </div>
                            </div>
                            <div class="option">
                                <span>Hyper Text Language</span>
                                <div class="icon cross">
                                    <i class="fas fa-times"></i>
                                </div>
                            </div>
                            <div class="option">
                                <span>Hyper Text MarkUp Language</span>
                            </div>
                            <div class="option">
                                <span>Hyper Language Text</span>
                            </div>-->
                        </div>
                    </section>

                    <!-- Quiz Box Footer -->
                    <footer>
                        <div class="total_que">
                            <#--<span><p>2</p>of<p>5</p>Questions</span>-->
                        </div>
                        <button class="next_btn">
                            Next Question
                        </button>
                    </footer>
                </div>
            <!-- Quiz Box Ends here -->

            <!-- Result Box -->
            <div class="result_box">
                <div class="icon">
                    <i class="fas fa-crown"></i>
                </div>
                <div class="complete_text">You've completed the quiz</div>
                <div class="score_text">
                    <#--<span>and sorry, You got only <p>2</p> out of <p>5</p></span>-->
                </div>
                <div class="buttons">
                    <button class="restart">Restart</button>
                    <button class="quit">Quit Quiz</button>
                </div>
            </div>

        </div>
    </section>

    <!-- Quiz JS File Goes Here -->
        <script src="../static/js/quiz.js"></script>
    <!-- Quiz JS File Ends Here -->

    <!-- Quiz JS File of Question JSON JS Objects Goes here -->
        <script src="../static/js/questions.js"></script>
    <!-- Quiz JS File of Question JSON JS Objects Ends here -->

</@c.page>