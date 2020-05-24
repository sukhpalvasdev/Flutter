import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

//  String resultText;
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = "Need to learn a lot \nFound just 20% Devil in You!";
    } else if (resultScore <= 12) {
      resultText = "Not Bad \nFound about 40% Devil in You!";
    } else if (resultScore <= 16) {
      resultText = "Perfect Balance \nFound about 65% Devil in You!";
    } else {
      resultText = "WoW \nFound about 80% Devil in You!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
