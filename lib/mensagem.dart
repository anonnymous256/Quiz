import 'package:flutter/material.dart';
import 'quiz_surpreza.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesafioFinal();
  }
}

class DesafioFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/Lucario.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 4, 201),
              ),
              child: Text(
                'Agora vamos ver se você realmente entende de pokémon!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage2()),
                ),
                child: Text("Continuar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 5, 22, 175),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
