import 'package:flutter/material.dart';
import 'mensagem.dart';

class QuizPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'lib/assets/images/ash2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 57, 4, 107),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Parabéns!\nVocê conquistou todas as insígnias!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 150),
              Image.asset('lib/assets/images/trio.png'),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage()),
                    );
                  },
                  child: Text("Desafio Final"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 29, 1, 73),
                    foregroundColor: Color.fromARGB(255, 252, 255, 254),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
