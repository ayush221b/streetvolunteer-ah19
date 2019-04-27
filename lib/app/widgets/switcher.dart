import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';
import 'package:streetvolunteer_ah19/app/widgets/options.dart';

class Switcher extends StatefulWidget {
  final AnimationController controller;
  final MainModel model;

  Switcher(this.model, {this.controller});

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(
            CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    String imagePath = "assets/active.jpg";
    String cardText = "Active Campaigns";
    Function tapFunction = () {};
    return Container(
      child: Stack(
        children: <Widget>[
          OptionsPanel(widget.model),
          PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: header_height,
                  ),

                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                            ),
                            Text("Hello,",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                            ),
                            Text(
                              "Ayush Shekhar",
                              style: TextStyle(
                                fontSize: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 15),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new DashboardCard(
                          tapFunction: tapFunction,
                          imagePath: imagePath,
                          cardText: cardText),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      DashboardCard(
                          tapFunction: tapFunction,
                          imagePath: 'assets/upcoming.jpg',
                          cardText: 'Upcoming Campaigns'),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  //Second Row of Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DashboardCard(
                          tapFunction: tapFunction,
                          imagePath: 'assets/complete.jpg',
                          cardText: 'Completed Campaigns'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      DashboardCard(
                          tapFunction: tapFunction,
                          imagePath: 'assets/browse.jpg',
                          cardText: 'Browse Campaigns'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    @required this.tapFunction,
    @required this.imagePath,
    @required this.cardText,
  }) : super(key: key);

  final Function tapFunction;
  final String imagePath;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(7),
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover
                          
                        )
                      ),
                      
                          ),
                  Container(
                    
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black38
                    ),

                  ),
                  Container(
                    height: 160,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cardText,
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
