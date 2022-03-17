import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      //margin: const EdgeInsets.all(5),
      width: double.infinity,

      child: ElevatedButton(
        // In RaisedButton: color: Colors.blue,
        // textColor: Colors.white,
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.blue,
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
