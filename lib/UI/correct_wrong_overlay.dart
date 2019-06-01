import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverLay extends StatefulWidget {
  final bool is_correct;
  final VoidCallback _onTap;

  CorrectWrongOverLay(this.is_correct, this._onTap);

  @override
  State<StatefulWidget> createState() {
    return new CorrectWrongOverLayState();
  }
}

class CorrectWrongOverLayState extends State<CorrectWrongOverLay>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black45,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child:  new Icon((widget.is_correct) ? Icons.done : Icons.clear,
                    size: 80.0),
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new Text((widget.is_correct) ? "Correct" : "Incorrect",
                style: new TextStyle(fontSize: 50.0, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
