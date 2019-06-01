import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final Color color;
  final String title;
  final String route;
  const MyCard({Key key, this.color, this.title, this.route}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState(color, title, route);
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  final Color color;
  final String title;
  final String route;

  _MyCardState(this.color, this.title, this.route);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SlideTransition(
            position: _offsetFloat,
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
                        style: TextStyle(
                            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ))));
  }
}
