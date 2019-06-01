import 'package:flutter/material.dart';
import 'package:flutterhub/myCard.dart';
import 'package:flutterhub/rank.dart';
import 'package:flutterhub/showcase.dart';

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
      routes: {
        '/quiz': (context) => SecondPage(),
        '/showcase': (context) => new ShowcaseView(),
        '/ranking': (context) => RankingScreen()
      },
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Hub')),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyCard(
              color: Colors.blue[300],
              title: 'Quiz',
              route: '/quiz',
            ),
            MyCard(
                color: Colors.blue[200], title: 'Showcase', route: '/showcase'),
            MyCard(
              color: Colors.blue[100],
              title: 'Rank',
              route: '/ranking',
            )
          ],
        ),
      ),
    );
  }
}
