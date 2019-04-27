import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampaignDetail extends StatefulWidget {
  @override
  _CampaignDetailState createState() => _CampaignDetailState();
}

class _CampaignDetailState extends State<CampaignDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Campaign Name", style: TextStyle(color: Color(0xFF014656)),),
              background: Image.asset(
                "assets/cleanlinessDrive.jpg",
                fit: BoxFit.cover,
              ),
              
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Center(
                      child: RaisedButton(
                        elevation: 3,
                        color: Color(0xFF014656),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.person_add, color: Colors.white,),
                            Text("   Join", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        onPressed: (){},
                      ),
                    )
                    ),
                    Container(
                      width: 350,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Material(
                        // color: Color(0xFF014656),
                        color: Color(0xFF00a2ad),
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Description",
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mi urna, ornare sit amet ultricies in, imperdiet sed velit. Phasellus et risus quam. Duis commodo molestie lorem, sit amet facilisis sapien dictum a. Praesent condimentum purus nec quam posuere, in luctus erat varius. Aliquam nec blandit arcu. Duis mattis sodales nunc nec luctus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum suscipit risus nec ultricies pharetra. Quisque at semper augue. Aliquam ultricies felis leo. Duis semper at sapien non volutpat.",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 350,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Material(
                        color: Color(0xFF00a2ad),
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Starts",
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.white
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "14-05-2019",
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 350,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Material(
                        color: Color(0xFF00a2ad),
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Ends",
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "14-06-2019",
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 350,
                    
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Material(
                        color: Color(0xFF00a2ad),
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Volunteers",
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("1"),
                                            backgroundColor: Color(0xFF014656),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("2"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("3"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("4"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("5"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("6"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("7"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("8"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("9"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("10"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            child: Text("11"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
