import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('GB'),
            ),
            title: Text('Gautier'),
            trailing: Text('Score: 1,000,000'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('JF'),
            ),
            title: Text('Joshua'),
            trailing: Text('Score: 950,000'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('JC'),
            ),
            title: Text('Jiat'),
            trailing: Text('Score: 930,000'),
          )
        ],
      ),
    );
  }
}
