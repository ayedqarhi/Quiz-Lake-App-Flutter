import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  final String questionText;
  const QuestionView(this.questionText, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.5),
      padding: EdgeInsets.all(8.5),
      width: double.infinity,
      color: Colors.purple,
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 33,
          color: Colors.white,
        ),
      ),
    );
  }
}
