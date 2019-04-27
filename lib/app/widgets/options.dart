import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class OptionsPanel extends StatelessWidget {
  final MainModel model;

  OptionsPanel(this.model);

  final TextStyle whiteTextStyle =
      TextStyle(color: Colors.white, fontSize: 20.0);
  final TextStyle inAvatarStyle = TextStyle(color: Colors.teal, fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              UserInformation(
                inAvatarStyle: inAvatarStyle,
                whiteTextStyle: whiteTextStyle,
                model: model,
              ),
              SizedBox(
                height: 20.0,
              ),
              PanelOptions(model, whiteTextStyle),
            ],
          ),
        );
      },
    );
  }
}

class PanelOptions extends StatelessWidget {
  final TextStyle whiteTextStyle;
  final MainModel model;

  PanelOptions(this.model, this.whiteTextStyle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Create Campaign',
              style: whiteTextStyle,
            ),
            leading: Icon(Icons.add, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Browse Campaigns',
              style: whiteTextStyle,
            ),
            
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'My Profile',
              style: whiteTextStyle,
            ),
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'My Campaigns',
              style: whiteTextStyle,
            ),
          
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Logout',
              style: whiteTextStyle,
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation(
      {Key key,
      @required this.inAvatarStyle,
      @required this.whiteTextStyle,
      @required this.model})
      : super(key: key);

  final TextStyle inAvatarStyle;
  final TextStyle whiteTextStyle;
  final MainModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.white,
              child: ClipOval(
                  child: Image.network(
                '',
                fit: BoxFit.cover,
                width: 90.0,
                height: 90.0,
              )),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '',
            style: whiteTextStyle,
          )
        ],
      ),
    ));
  }
}
