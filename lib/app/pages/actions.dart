import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/pages/drawer.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class ActionsPage extends StatefulWidget {
  final MainModel model;

  const ActionsPage({Key key, this.model}) : super(key: key);
  @override
  _ActionsPageState createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actions'),
        
      ),
      drawer: DrawerMenu(),
      body: ListView(
        children: <Widget>[
          Material()
        ],
      ),
    );
  }
}