// Implement all required elemetns
const startBtn = document.querySelector('.start_btn button');
const infoBox = document.querySelector('.info_box');
const exitBtn = infoBox.querySelector('.buttons .quit');
const continueBtn = infoBox.querySelector('.buttons .restart');
const quizBox = document.querySelector('.quiz_box');
const optionList = document.querySelector('.option_list');
const timerCount = quizBox.querySelector('.timer .timer_sec ');
const timerCountLine = quizBox.querySelector('.time_line ');
const resultBox = document.querySelector('.result_box');
const restartButton = resultBox.querySelector('.buttons .restart');
const quitButton = resultBox.querySelector('.buttons .quit');
const timerText = quizBox.querySelector('.time_text');

// If Start button was pressed call info box
startBtn.onclick = () => {
    infoBox.classList.add('activeInfo');
}

// After Finishing the button there will be Quit button in the result box if it was pressed reload the page
quitButton.onclick = () => {
    window.location.reload();
}

// After Finishing the button there will be Replay button in the result box if it was pressed Open Quiz Box immediately
restartButton.onclick = () => {
    quizBox.classList.add('activeQuiz');
    resultBox.classList.remove('activeResult');

    let queCount = 0;
    let queCountNumber = 1;
    let countTime;
    let countTimeLine;
    let interval = 15;
    let timeLineInterval = 0;
    let userScore = 0;

    showQuestions(queCount);
    countQue(queCountNumber);
    clearInterval(countTime);
    startTime(interval);
    clearInterval(countTimeLine);
    startTimeLine(timeLineInterval);
    nextButton.style.display = 'none';
}

// If EXit Button was pressed remove info box
exitBtn.onclick = () => {
    infoBox.classList.remove('activeInfo');
}

// If Continue button was pressed remove info box and reveal quiz box
continueBtn.onclick = () => {
    infoBox.classList.remove('activeInfo');
    quizBox.classList.add('activeQuiz');
    showQuestions(0);
    countQue(1);
    startTime(15);
    startTimeLine(0);
}

let queCount = 0;
let queCountNumber = 1;
let countTime;
let countTimeLine;
let interval = 15;
let timeLineInterval = 0;
let userScore = 0;

const nextButton = quizBox.querySelector('.next_btn');

nextButton.onclick = () => {
    if (queCount < questions.length - 1) {
        queCount++;
        queCountNumber++;
        showQuestions(queCount);
        countQue(queCountNumber);


        clearInterval(countTime);
        startTime(interval);

        clearInterval(countTimeLine);
        startTimeLine(timeLineInterval);

        nextButton.style.display = 'none';
        timerText.textContent = 'Time Left';
    } else {
        clearInterval(countTime);
        clearInterval(countTimeLine);
        console.log("Questions Ended");
        showResultBox();
    }
}

// Getting ID, options, answer, question
function showQuestions(index) {
    const queText = document.querySelector('.que_text');
    let queTag = '<span>' + questions[index].id + '. ' + questions[index].question + '</span>';
    queText.innerHTML = queTag;

    let optionsTag = '<div class="option"><span>' + questions[index].options[0] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[1] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[2] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[3] + '</span></div>';
    optionList.innerHTML = optionsTag;


    const option = optionList.querySelectorAll('.option');
    for(let i = 0; i < option.length; i++) {
        option[i].setAttribute('onclick', 'optionSelected(this)');
    }
}

let tickIcon = '<div class="icon tick"><i class="fas fa-check"></i></div>'
let crossIcon = '<div class="icon cross"><i class="fas fa-times"></i></div>'

function optionSelected(answer) {
    clearInterval(countTime);
    clearInterval(countTimeLine);
    let userAns = answer.textContent;
    let correctAns = questions[queCount].answer;
    let allOptions = optionList.children.length;
    if (userAns === correctAns) {
        userScore += 1;
        console.log(userScore);
        answer.classList.add('correct')
        console.log("Answer is correct");
        answer.insertAdjacentHTML('beforeend', tickIcon);
    } else {
        answer.classList.add('incorrect')
        console.log("Wrong");
        answer.insertAdjacentHTML('beforeend', crossIcon);

        // Show The Correct answer if the wrong was pressed
        for (let i = 0; i < allOptions; i++) {
            if (optionList.children[i].textContent === correctAns) {
                optionList.children[i].setAttribute('class', 'option correct');
                optionList.children[i].insertAdjacentHTML('beforeend', tickIcon);
            }
        }

    }

    // Once User clicked disable all other buttons

    for (let i = 0; i < allOptions; i++) {
        optionList.children[i].classList.add('disabled');
    }

    nextButton.style.display = 'block';
}

function countQue(index) {
    const bottomQueCounter = quizBox.querySelector('.total_que');
    let totalQue = '<span><p>' + queCountNumber + '</p>of<p>' + questions.length + '</p>Questions</span>'
    bottomQueCounter.innerHTML = totalQue
}

function startTime(time) {
    countTime = setInterval(timer, 1000);
    function  timer() {
        timerCount.textContent = time;
        time--;
        if (time < 9) {
            let addZero = timerCount.textContent;
            timerCount.textContent = "0" + addZero;
        }
        if(time < 0) {
            clearInterval(countTime);
            timerCount.textContent = "00";

            timerText.textContent = 'Time Off';
            let correctAns = questions[queCount].answer;
            let allOptions = optionList.children.length;
            for (let i = 0; i < allOptions; i++) {
                if (optionList.children[i].textContent === correctAns) {
                    optionList.children[i].setAttribute('class', 'option correct');
                    optionList.children[i].insertAdjacentHTML('beforeend', tickIcon);
                }
            }

            for (let i = 0; i < allOptions; i++) {
                optionList.children[i].classList.add('disabled');
            }

            nextButton.style.display = 'block';
        }
    }
}

function startTimeLine(time) {
    countTimeLine = setInterval(timer, 29);
    function  timer() {
        time += 1;
        timerCountLine.style.width = time + "px";
        if (time > 549) {
            clearInterval(countTimeLine);
        }
    }
}

function showResultBox() {
    infoBox.classList.remove('activeInfo');
    quizBox.classList.remove('activeQuiz');
    resultBox.classList.add('activeResult');
    const scoreText = resultBox.querySelector('.score_text');
    let scoreTag;

    if (userScore < 3) {
        scoreTag = '<span>and awesome result, You got <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
    } else if (userScore >= 3) {
        scoreTag = '<span>and nice result, You got <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
    } else {
        scoreTag = '<span>and result, You got <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
    }

}