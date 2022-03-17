import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //Todo implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'s National Animal Of India ?',
      'answers': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Peacock', 'score': 2},
        {'text': 'Elephant', 'score': 0},
      ],
    },
    {
      'questionText': 'Who\'s founder of Facebook ?',
      'answers': [
        {'text': 'Andy Jassy', 'score': 0},
        {'text': 'Mark Zuckerberg', 'score': 10},
        {'text': 'Satya Nadella', 'score': 5},
        {'text': 'Sunder Pichai', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s founder of Google ?',
      'answers': [
        {'text': 'Sachin Bansal', 'score': 0},
        {'text': 'Satya Nadella', 'score': 5},
        {'text': 'Sunder Pichai', 'score': 2},
        {'text': 'Larry Page', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _prevBtn() {
    setState(() {
      if (_questionIndex < 1) {
        return;
      }
      _questionIndex--;
    });
  }

  void _nextBtn() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.brown[100], //changes whole screen background color
        appBar: AppBar(
          title:
              Text('Flutter Quiz App', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions,
                    )
                  : Result(_totalScore, _resetQuiz),
            ),
            Container(
              //color: Colors.lightBlueAccent,
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: _prevBtn,
                    child: Text(
                      'Previous',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          backgroundColor: Colors.blue),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 3.0),
                      primary: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: _nextBtn,
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          backgroundColor: Colors.blue),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
