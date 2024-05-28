import 'package:flutter/material.dart';
import 'dart:async';
import 'respostaerrada.dart';
import 'finalQuiz.dart';

class QuizPage2 extends StatefulWidget {
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  int questionIndex = 0;
  int score = 0;
  int tempo = 10;
  Timer? timer;
  int? lastIncorrectQuestionIndex;

  List<Question> questions = [
    Question(
      'Quem é esse Pokémon?',
      2,
      ['Pikachu', 'Squirtle', 'Abomasnow', 'Bulbasaur'],
      'lib/assets/images/bulbassauro1.png',
      'lib/assets/images/bulbassauro2.png',
    ),
    Question(
      'Quem é esse Pokémon?',
      2,
      ['Gengar', 'Scephial', 'Misdreavus', 'Raichu'],
      'lib/assets/images/Gengar1.png',
      'lib/assets/images/Gengar2.png',
    ),
    Question(
      'Quem é esse Pokémon?',
      0,
      ['Charmander', 'Squirtle', 'Latios', 'Sell'],
      'lib/assets/images/Sell1.png',
      'lib/assets/images/Sell2.png',
    ),
    Question(
      'Quem é esse Pokémon?',
      1,
      ['Salamence', 'Greninja', 'Mewtwo', 'Margiot'],
      'lib/assets/images/Mewtwo1.png',
      'lib/assets/images/Mewtwo2.png',
    ),
    Question(
      'Quem é esse Pokémon?',
      3,
      ['Pichu', 'Squirtle', 'Lugia', 'Quagsire'],
      'lib/assets/images/Squirdle1.png',
      'lib/assets/images/Squirdle2.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    setState(() {
      tempo = 10;
    });
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (tempo > 0) {
        setState(() {
          tempo--;
        });
      } else {
        timer.cancel();
        checkAnswer(-1);
      }
    });
  }

  void checkAnswer(int userAnswerIndex) {
    int correctAnswerIndex = questions[questionIndex].correctOption;
    setState(() {
      if (userAnswerIndex == correctAnswerIndex) {
        score++;
        questions[questionIndex].answeredCorrectly = true;
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          startTimer();
        } else {
          timer?.cancel();
        }
      } else {
        lastIncorrectQuestionIndex = questionIndex;
        questions[questionIndex].answeredCorrectly = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaginaErro(resetQuiz, questions[questionIndex].errorImagePath),
          ),
        );
      }
      bool allCorrect =
          questions.every((question) => question.answeredCorrectly == true);
      if (allCorrect && questionIndex == questions.length - 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultScreen(score),
          ),
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      lastIncorrectQuestionIndex = null;
      questions.forEach((question) {
        question.answeredCorrectly = null;
      });
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/fundopoke.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      child: Image.asset(
                        questions[questionIndex].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromARGB(240, 1, 74, 156),
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        questions[questionIndex].questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                questions[questionIndex].options.length,
                (index) => SizedBox(
                  width: 170.0,
                  height: 70.0,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    child: Text(questions[questionIndex].options[index]),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Color.fromARGB(240, 1, 74, 156),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color.fromARGB(255, 5, 22, 175),
                ),
                child: Text(
                  'Tempo restante: $tempo segundos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: resetQuiz,
                    child: Text('Recomeçar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 5, 22, 175),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final int correctOption;
  final List<String> options;
  final String imagePath;
  final String errorImagePath;
  bool? answeredCorrectly;

  Question(this.questionText, this.correctOption, this.options, this.imagePath,
      this.errorImagePath);
}
