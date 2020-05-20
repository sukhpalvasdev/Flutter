//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

//void main(){
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Blue', 'Red', 'Green'],
      },
      {
        'questionText': 'What\'s your pet\s name?',
        'answers': ['Dog', 'Cat', 'Rabbit', 'Lion'],
      },
      {
        'questionText': 'What\'s your favourite software?',
        'answers': ['Mari', 'Katana', 'Houdini', 'Maya'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
