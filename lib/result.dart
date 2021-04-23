import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int finalScore;
  final Function resetHandler;
  Result(this.finalScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Here are your results: ';
    var freeTime = 168 - 10 - finalScore;
    
    resultText += 'Each week you have: \n '  
                  + (freeTime * 0.3).toString() + 'h for hobbies, \n'
                  + (freeTime * 0.3).toString() + 'h for socializing,\n'
                  + (freeTime * 0.4).toString() + 'h for furthering your goals,\n'
                  + "Are you a master of your time?";


    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase, 
            style: TextStyle(
              fontSize: 28, 
              ),
            textAlign: TextAlign.center,
            ),
          FlatButton(
            child: Text('Restart Quiz!'), 
            textColor: Colors.blue,
            onPressed: resetHandler
          ),
        ],
      )
    );
  }
}