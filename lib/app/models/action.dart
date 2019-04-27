/*
Id - String
Name - String
Description -  String
Campaign_id : String (id of attached campaign)
Assignees : List<String> (Id of Volunteers assigned to campaign)
Status:  Active, Upcoming, Pending, Completed
Completion_date: Date
*/

class Action {
  String id;
  String name;
  String description;
  String campaignId;
  List<String> assignees;
  String status;
  DateTime completionDate;

  Action(
    this.id,
    this.name,
    this.assignees,
    this.campaignId,
    this.completionDate,
    this.description,
    this.status
  );

  Action.fromMap(Map<String, dynamic> map) {

    id = map['id'];
    campaignId = map['campaignId'];
    name = map['name'];
    assignees = map['assignees'];
    completionDate = map['completionDate'];
    description = map['description'];
    status = map['status'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['campaignId'] = campaignId;
    map['name'] = name;
    map['assignees'] = assignees;
    map['completionDate'] = completionDate;
    map['description'] = description;
    map['status'] = status;
    return map;
  }
}