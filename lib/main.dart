import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello'),
    );
  }
}

class NavLink {
  final String title;
  final Widget _widget;
  NavLink(this.title, this._widget);

  void onPress(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => _widget));
  }
}

class MyHomePage extends StatelessWidget {
  final navLinks = [
    NavLink('Quiz', SecondPage()),
    NavLink('Showcase', SecondPage()),
    NavLink('Ranking', SecondPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Flutter Hub')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...navLinks.map((item) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: SizedBox(
                      height: 50,
                      child: OutlineButton(
                        child: Text(item.title),
                        textColor: Colors.white,
                        onPressed: () => item.onPress(context),
                        borderSide: BorderSide(color: Colors.white),
                      )));
            })
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff055A9D), Color(0xff5FC9F8)])),
      ),
    );
  }
}
