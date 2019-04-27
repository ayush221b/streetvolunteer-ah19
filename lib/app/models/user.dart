/*
userid - string (unique) 
Name - string
Age - int
Location - Map<String, double> (latitude, longitude) / js object
Interests - List<String>
Campaigns - Map<String, List<String>> : Active : List of Campaigns ids, Completed::, Upcoming::, Initiated::, Incomplete::
sv _points: awarded as per contribution (int)
Avatar - String (Url of avatar)
*/

class User {
  String userid;
  String name;
  int age;
  Map<String, double> location;
  List<String> interests;
  Map<String, List<String>> campaigns;
  int svPoints;
  String avatarUrl;

  User(this.userid, this.name, this.age, this.location, this.campaigns,
      this.svPoints, this.avatarUrl);

  User.fromMap(Map<String, dynamic> map) {

    userid = map['userid'];
    name = map['name'];
    age = map['age'];
    location = map['location'];
    interests = map['interests'];
    campaigns = map['campaigns'];
    svPoints = map['svPoints'];
    avatarUrl = map['avatarUrl'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['userid'] = userid;
    map['name'] = name;
    map['age'] = age;
    map['location'] = location;
    map['interests'] = interests;
    map['campaigns'] = campaigns;
    map['svPoints'] = svPoints;
    map['avatarUrl'] = avatarUrl;
    return map;
  }
}
