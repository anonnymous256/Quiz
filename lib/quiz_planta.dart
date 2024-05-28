import 'package:flutter/material.dart';
import 'dart:async';
import 'score_planta.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;
  int tempo = 10;
  Timer? timer;

  List<Question> questions = [
    Question('Qual é o inicial de planta da Quinta geração?', 2,
        ['Bulbasaur', 'Treecko', 'Snivy', 'Chespin']),
    Question('Qual o golpe que faz os adversários dormirem em combate?', 1,
        ['Smokescreen', 'Sleep-powder', 'Poison-powder', 'Sneak']),
    Question('Qual desses é a flor dos pokémons ?', 3,
        ['Scyther', 'Heracross', 'Chikorita', 'Flabébé']),
    Question('Qual a melhor pokebola para capturar pokémons de planta?', 2,
        ['Grass ball', 'Ultra ball', 'Janguru Ball', 'Net Ball']),
    Question('Pokémons Planta são fortes contra?', 0,
        ['Água/Pedra', 'Lutador/Veneno', 'Fogo/Elétrico', 'Gelo/Fantasma']),
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
    int correctAnswerIndex = questions[questionIndex].opcaocorreta;
    setState(() {
      if (userAnswerIndex == correctAnswerIndex) {
        score++;
      }
      if (userAnswerIndex != correctAnswerIndex ||
          questionIndex == questions.length - 1) {
        timer?.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TelaResultado(score, questions.length, resetQuiz),
          ),
        );
      } else {
        questionIndex++;
        startTimer();
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
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
            image: AssetImage('lib/assets/images/planta1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromARGB(195, 1, 148, 92),
                  ),
                  child: Text(
                    questions[questionIndex].questiontext,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 40.0,
              runSpacing: 50.0,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                questions[questionIndex].opcao.length,
                (index) => SizedBox(
                  width: 170.0,
                  height: 75.0,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    child: Text(questions[questionIndex].opcao[index]),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 15.0),
                      backgroundColor: Color.fromARGB(195, 1, 148, 92),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Pergunta: ${questionIndex + 1} / ${questions.length}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color.fromARGB(255, 9, 90, 2),
                ),
                child: Text(
                  'Tempo restante: $tempo segundos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: resetQuiz,
                  child: Text('Recomeçar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 9, 90, 2),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questiontext;
  final int opcaocorreta;
  final List<String> opcao;

  Question(this.questiontext, this.opcaocorreta, this.opcao);
}
