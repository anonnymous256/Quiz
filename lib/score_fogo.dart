import 'package:flutter/material.dart';
import 'tela_nova.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  TelaResultado(this.pontuacao, this.totalPerguntas, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    if (pontuacao == 5) {
      return TelaResultadoBoa(totalPerguntas, resetQuiz);
    } else {
      return TelaResultadoRuim(totalPerguntas, resetQuiz);
    }
  }
}

class TelaResultadoBoa extends StatelessWidget {
  final int totalPerguntas;
  final Function resetQuiz;

  TelaResultadoBoa(this.totalPerguntas, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'lib/assets/images/foibemfg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 177, 1, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Parabéns!\nVocê conquistou a insígnia da Fogo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetQuiz();
                      Navigator.pop(context);
                    },
                    child: Text("Reiniciar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 66, 1, 1),
                      foregroundColor: Color.fromARGB(255, 252, 255, 254),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPageState()),
                      );
                    },
                    child: Text("Finalizar Quiz"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 66, 1, 1),
                      foregroundColor: Color.fromARGB(255, 252, 255, 254),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class TelaResultadoRuim extends StatelessWidget {
  final int totalPerguntas;
  final Function resetQuiz;

  TelaResultadoRuim(this.totalPerguntas, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'lib/assets/images/foimalfg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 177, 1, 12),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Você ainda não é um mestre pokemon!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetQuiz();
                      Navigator.pop(context);
                    },
                    child: Text("Tente Novamete"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 66, 1, 1),
                      foregroundColor: Color.fromARGB(255, 252, 255, 254),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
