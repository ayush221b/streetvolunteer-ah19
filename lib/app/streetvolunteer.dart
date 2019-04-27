import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:streetvolunteer_ah19/app/pages/dashboard.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class StreetVolunteer extends StatefulWidget {
  @override
  _StreetVolunteerState createState() => _StreetVolunteerState();
}

class _StreetVolunteerState extends State<StreetVolunteer> {
  final MainModel _model = MainModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'StreetVolunteer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primaryColor: Color(0xFF014656), 

          
        ),
        initialRoute: '/',
        routes: {'/': (context) => Dashboard(model: _model)},
      ),
    );
  }
}
