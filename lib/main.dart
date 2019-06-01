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
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final navLinks = ['Questions', 'Widgets', 'Showcase'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Hub')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('ProgressBar'),
            ...navLinks.map((title) {
              return RaisedButton(
                child: Text(title),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
