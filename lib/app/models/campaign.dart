/*
id: auto_generated (uuid)
Status: enum {Active, Upcoming, Completed, Incomplete}
Creator - String (userid of the user who initiated the campaign)
Volunteers - List<String> (list of userids of all member volunteers)
Location: Map<double, double> (latitude, longitude) / js object
start _date : Date
End_date: Date
Title: Short title for the campaign (max: 40 characters) - String
Description: Long description of Campaign - String
Actions: Active, Upcoming, Pending, Completed (List of string ids for each)
Chat: id (String) the id of the chat
Comments - List<String>
*/

import 'package:meta/meta.dart';

class Campaign {
  @required
  String id;
  @required
  String title;
  @required
  String description;
  @required
  String status;
  @required
  String category;
  @required
  String creatorId;
  @required
  List<String> volunteers;
  @required
  Map<String, double> location;
  @required
  DateTime startDate;
  @required
  DateTime endDate;
  @required
  List<String> actions;
  @required
  String chatId;
  @required
  List<String> comments;
  @required
  List<String> images;
  String locationName;

  Campaign(
      this.id,
      this.title,
      this.description,
      this.status,
      this.creatorId,
      this.volunteers,
      this.location,
      this.startDate,
      this.endDate,
      this.actions,
      this.chatId,
      this.comments,
      this.images,
      this.locationName,
      this.category);

  Campaign.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    location = map['location'];
    status = map['status'];
    creatorId = map['creatorId'];
    volunteers = map['volunteers'];
    startDate = map['startDate'];
    endDate = map['endDate'];
    actions = map['actions'];
    chatId = map['chatId'];
    comments = map['comments'];
    images = map['images'];
    locationName = map['locationName'];
    category = map['category'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['location'] = location;
    map['status'] = status;
    map['creatorId'] = creatorId;
    map['volunteers'] = volunteers;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['actions'] = actions;
    map['chatId'] = chatId;
    map['comments'] = comments;
    map['images'] = images;
    map['locationName'] = locationName;
    map['category'] = category;
    return map;
  }
}
