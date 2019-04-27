import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget draw = Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
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