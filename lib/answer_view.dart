import 'package:flutter/material.dart';

class AnswerView extends StatelessWidget {
  final String answerText;
  final Function() func;
  const AnswerView(this.answerText, this.func, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.5),
      width: double.infinity,
      child: FlatButton(
        onPressed: func,
        color: Colors.blue,
        padding: EdgeInsets.all(8.5),
        child: Text(answerText,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )),
      ),
    );
  }
}
