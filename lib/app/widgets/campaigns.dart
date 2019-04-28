import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/models/campaign.dart';
import 'package:streetvolunteer_ah19/app/pages/campaigndetail.dart';
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
    return Column(
      children: widget.model.campaignsList.map((Campaign campaign) {
        print(campaign);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return CampaignDetail(
                  model: widget.model,
                  campaign: campaign,
                );
              }));
            },
            child: Material(
              elevation: 5,
              textStyle: TextStyle(color: Colors.white),
              borderRadius: BorderRadius.circular(7),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Hero(
                          tag: 'details',
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage('${campaign.images[0]}'))),
                          ),
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
                                    "${campaign.title}",
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
                                  child: Text(
                                      "Initiated by ${campaign.creatorId}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.group,
                                        color: Colors.white,
                                      ),
                                      Text(
                                          " ${campaign.volunteers.length} Volunteers")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Text(
                                      "Starts on ${campaign.startDate.toIso8601String().substring(0, 10)}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Text(
                                      "Ends on ${campaign.endDate.toIso8601String().substring(0, 10)}"),
                                ),
                                LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.pin_drop,
                                                    color: Colors.white,
                                                  ),
                                                  Text(campaign.locationName),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            )
                                          ],
                                        ));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      }).toList(),
    );
  }
}
