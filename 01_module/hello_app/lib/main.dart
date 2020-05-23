//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import './question.dart';
//import './answer.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'Choose Your Color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 4},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5}
      ],
    },
    {
      'questionText': 'Choose Your Animal',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Dolphin', 'score': 6},
        {'text': 'Pandas', 'score': 1},
        {'text': 'Elephant', 'score': 8}
      ],
    },
    {
      'questionText': 'Your Eating Pace',
      'answers': [
        {'text': 'Speed eater', 'score': 10},
        {'text': 'Regimented - Pace Driven by Your Schedule', 'score': 7},
        {'text': 'Chameleon - Adaptive', 'score': 5},
        {'text': 'Slow eater',  'score': 2}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Find Devil in You!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
