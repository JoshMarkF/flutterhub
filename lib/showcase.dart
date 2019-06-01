import 'package:flutter/material.dart';

class Comment {
  String title;
  String commentbody;
  String avatarImage;
  Comment(this.title, this.commentbody, this.avatarImage);
}

class Showcase {
  String title;
  String description;
  Showcase(this.title, this.description);
}

class ShowcaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Showcase'),
        ),
        body: Container(
            child: new ShowcaseList(showcases: [
          new Showcase("Showcase 1", "Description 1"),
          new Showcase("Showcase 2", "Description 2"),
        ])));
  }
}

class ShowcaseList extends StatefulWidget {
  final List<Showcase> showcases;
  ShowcaseList({List<Showcase> showcases}) : showcases = showcases;
  @override
  State createState() => _ShowCaseListState(showcases);
}

class _ShowCaseListState extends State<ShowcaseList> {
  _ShowCaseListState(List<Showcase> showcases) : showcases = showcases;
  final List<Showcase> showcases;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding: new EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: showcases.map((Showcase showcase) {
              return new ListTile(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowcaseExample()),
                    ),
                contentPadding: new EdgeInsets.symmetric(vertical: 8.0),
                leading: new Image.asset('assets/flutter_code2.png'),
                title: Text(showcase.title),
                subtitle: Text(showcase.description),
              );
            }).toList(),
          )),
        ],
      ),
    ));
  }
}

class ShowcaseExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Screenshot')),
              new Container(
                  padding: const EdgeInsets.all(10.0), child: Text('Comments')),
            ],
          ),
          title: Text('Showcase'),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Container(
                    padding: new EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        child: new Image.asset(
                      'assets/flutter_code1.png',
                      height: 450.0,
                    )))),
            new ShowcaseCommentList(comments: [
              new Comment('Awesome Code', 'I love this code so much', 'A'),
              new Comment('Awesome Code', 'I love this code so much', 'B'),
              new Comment('Awesome Code', 'I love this code so much', 'C'),
            ])
          ],
        ),
      ),
    );
  }
}

class ShowcaseCommentList extends StatefulWidget {
  final List<Comment> comments;
  ShowcaseCommentList({List<Comment> comments}) : comments = comments;
  @override
  _CommentListState createState() {
    return new _CommentListState(comments);
  }
}

class _CommentListState extends State<ShowcaseCommentList> {
  _CommentListState(List<Comment> comments) : comments = comments;
  final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding: new EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: comments.map((Comment comment) {
              return new ListTile(
                  onTap: null,
                  leading: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: new Text(comment.avatarImage),
                  ),
                  title: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              comment.title,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            new Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: new Text(comment.commentbody))
                          ],
                        ),
                      )
                    ],
                  ));
            }).toList(),
          )),
        ],
      ),
    ));
  }
}
