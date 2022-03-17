import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'Better Luck Next Time!';
    } else if (resultScore <= 25) {
      resultText = 'Good, You can do better!';
    } else {
      resultText = 'Win Win !!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              ' Restart Quiz!! ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Colors.blue),
            ),
            // textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
