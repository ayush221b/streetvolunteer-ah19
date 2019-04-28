import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';
import 'package:streetvolunteer_ah19/app/widgets/campaigns.dart';

class BrowseCampaigns extends StatefulWidget {
  final MainModel model;

  const BrowseCampaigns({Key key, this.model}) : super(key: key);
  @override
  _BrowseCampaignsState createState() => _BrowseCampaignsState();
}

class _BrowseCampaignsState extends State<BrowseCampaigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.white24,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Browse Campaigns'),
              centerTitle: true,
              background: Hero(
                  tag: 'browse',
                  child: Image.asset(
                    'assets/browse.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                future: widget.model.getCampaigns(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData && snapshot.data != null) {
                    return Campaigns(model: widget.model);
                  } else
                    return Padding(
                      padding: const EdgeInsets.only(top:32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Loading Campaigns...'),
                          Container(
                            margin: EdgeInsets.all(32),
                            height: 2,
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
