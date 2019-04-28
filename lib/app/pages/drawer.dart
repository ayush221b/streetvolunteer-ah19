import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class DrawerMenu extends StatefulWidget {
  final MainModel model;

  const DrawerMenu({Key key, this.model}) : super(key: key);
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
            accountName: Text(
              "Pratik Singhal",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Create Campaign"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.peopleCarry),
            title: Text("Browse Campaign"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.personBooth),
            title: Text("My Campaigns"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
