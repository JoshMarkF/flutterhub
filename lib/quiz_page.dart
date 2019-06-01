import 'package:flutter/material.dart';
import 'package:flutterhub/UI/answer_button.dart';
import 'package:flutterhub/UI/question_text.dart';
import 'package:flutterhub/UI/correct_wrong_overlay.dart';
import 'package:flutterhub/UI/result_overlay.dart';

class Question {
  String _question;
  bool _ans;
  Question(this._question, this._ans);

  String get questionText => _question;
  bool get questionAns => _ans;
}

class Quiz {
  List<Question> _questions;
  int _score = 0;
  int _currentQuesIndex = -1;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  //getters
  int get score => _score;
  List<Question> get questions => _questions;
  int get currentQuesNo => _currentQuesIndex + 1;
  int get totalNoOfQues => _questions.length;

  Question get getNextQues {
    if (++_currentQuesIndex >= totalNoOfQues) return null;
    return _questions[_currentQuesIndex];
  }

  void updateScore(bool isCorrect) {
    if (isCorrect) _score++;
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Quiz quiz = new Quiz([
    new Question(
        "Flutter widgets are built using a modern react-style framework, which takes inspiration from React.",
        true),
    new Question(
        "StatefulWidgets are useful when the part of the user interface you are describing does not depend on anything other than the configuration information in the object.",
        false),
    new Question(
        "Flutter provides a number of widgets that help you build apps that follow Material Design",
        true),
  ]);

  Question currQues;
  int quesNo;
  String questionText;
  bool isCorrect;
  bool showOverlay = false;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    currQues = quiz.getNextQues;
    questionText = currQues.questionText;
    quesNo = quiz.currentQuesNo;
  }

  void handleAnswer(bool ans) {
    isCorrect = (ans == currQues.questionAns);
    quiz.updateScore(isCorrect);
    this.setState(() {
      showOverlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new QuestionText(questionText, quesNo),
                new AnswerButton(true, () => handleAnswer(true)),
                new AnswerButton(false, () => handleAnswer(false))
              ],
            ),
            (showOverlay)
                ? new CorrectWrongOverLay(isCorrect, () {
                    currQues = quiz.getNextQues;
                    if (currQues != null) {
                      this.setState(() {
                        showOverlay = false;
                        questionText = currQues.questionText;
                        quesNo = quiz.currentQuesNo;
                      });
                    } else {
                      this.setState(() {
                        showOverlay = false;
                        showResult = true;
                      });
                    }
                  })
                : new Container(),
            (showResult)
                ? new ResultOverlay(quiz.score, () {
                    this.setState(() {
                      showResult = false;
                    });
                  })
                : new Container(),
          ],
        ));
  }
}
