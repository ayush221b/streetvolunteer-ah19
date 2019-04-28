import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/models/campaign.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class Campaigns extends StatefulWidget {
  final MainModel model;

  const Campaigns({Key key, this.model}) : super(key: key);
  @override
  _CampaignsState createState() => _CampaignsState();
}

class _CampaignsState extends State<Campaigns> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: 
        widget.model.campaignsList.map((Campaign campaign) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(7),
              child: Container(
                  height: 250,
                  width: 200,
                  // margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              color: Colors.red),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                                  child: Text(
                                    "Lets Clean Chennai boiii ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                // Divider(),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Initiated by Ayush Shekhar"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.group),
                                      Text(" 7 Volunteers")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Text("Starts on 14-06-2018"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Text("Ends on 14-06-2019"),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.pin_drop),
                                              Text(" Chennai, TN"),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                        )
                                      ],
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        }).toList()
      ,
    );
  }
}
