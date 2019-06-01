import 'package:flutter/material.dart';

class ResultOverlay extends StatefulWidget {
  final int score;
  final VoidCallback _onTap;

  ResultOverlay(this.score, this._onTap);

  @override
  State<StatefulWidget> createState() {
    return new ResultOverlayState();
  }
}

class ResultOverlayState extends State<ResultOverlay> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black45,
      child: new InkWell(
        onTap: () => Navigator.pop(context),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text(widget.score.toString(),
                  style: new TextStyle(fontSize: 50.0, color: Colors.black)),
            ),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new Text((widget.score > 1) ? "Well Done" : "You Suck",
                style: new TextStyle(fontSize: 50.0, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
