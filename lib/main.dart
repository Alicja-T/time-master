import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _MyAppState();
  }


}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
      { 'questionText' : 'How many hours you sleep on average night?', 
        'answers' : [
          {'text' : '8h', 'score' : 8*7}, 
          {'text' : '7h', 'score' : 7*7}, 
          {'text' : '6h', 'score' : 6*7}, 
          {'text' : '9h', 'score' : 9*7}, 
         ],
      },
      { 'questionText' : 'How many hours a week you spend at work including commute time?', 
        'answers' : [
          {'text' : '40', 'score' : 40},
          {'text' : '50', 'score' : 50},
          {'text' : '60', 'score' : 60},
          {'text' : '30', 'score' : 30}
        ],
      },
      { 'questionText' : 'How many hours a week you spend on household chores?', 
        'answers' : [
          {'text' : '10', 'score' : 10},
          {'text' : '15', 'score' : 15},
          {'text' : '20', 'score' : 20},
          {'text' : '25', 'score' : 25},
        ],
      },
    ];

  void _restartQuiz() {
    setState( () {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    
    print(_questionIndex);
  }


  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Time Master'), ),
      body: _questionIndex < _questions.length ? 
      Quiz(
        answerQuestion: _answerQuestion, 
        questionIndex: _questionIndex, 
        questions: _questions)
        : Result(_totalScore, _restartQuiz),
    ), );
  }
}