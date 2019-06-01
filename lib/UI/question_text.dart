import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _quesNo;

  QuestionText(this._question, this._quesNo);

  @override
  State<StatefulWidget> createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Center(
      child: new Container(
        padding: new EdgeInsets.symmetric(vertical: 30.0),
        child: new Text(
          "Question " + widget._quesNo.toString() + ". " + widget._question,
        ),
      ),
    ));
  }
}
