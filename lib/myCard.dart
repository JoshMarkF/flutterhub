import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final String title;
  final String route;
  const MyCard({Key key, this.color, this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            margin: EdgeInsets.all(10.0),
            elevation: 20,
            color: color,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).pushNamed(route);
              },
              child: Stack(children: [
                Opacity(
                  opacity: 0.3,
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(color: Colors.white, fontSize: 200),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    title,
                    style:
                        TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            )));
  }
}
