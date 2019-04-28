import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:streetvolunteer_ah19/app/models/campaign.dart';
import 'package:streetvolunteer_ah19/app/models/user.dart';

class ConnectedCampaignModel extends Model {
  bool _isLoading;
  User _authenticatedUser;
  List<Campaign> _campaignsList;

  User get authUser {
    return _authenticatedUser;
  }

  List<Campaign> get campaignsList {
    return _campaignsList;
  }
}

class CampaignsModel extends ConnectedCampaignModel {
  Future<List<Campaign>> getCampaigns() async {
    List<Campaign> campaigns = [];
    try {
      String url = 'https://streetv.eu-gb.mybluemix.net/campaign/getnearby';
      var headers = {'Content-Type': 'application/json'};
      var body = {
        'category': _authenticatedUser.interests[0],
        'location': {
          "latitude": _authenticatedUser.location['latitude'],
          "longitude": _authenticatedUser.location['latitude']
        }
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(body));

      var responseData = json.decode(response.body)['campaigns'];
      responseData.forEach((campaignMap) {
        Map<String, double> location = {
          'latitude': campaignMap['location']['latitude'],
          'longitude': campaignMap['location']['longitude'],
        };
        List<String> volunteers = [];
        campaignMap['volunteers'].forEach((volunteer) {
          volunteers.add(volunteer);
        });
        List<String> actions = [];
        campaignMap['actions'].forEach((action) {
          actions.add(action);
        });
        List<String> comments = [];
        campaignMap['comments'].forEach((comment) {
          comments.add(comment);
        });
        List<String> images = [];
        campaignMap['images'].forEach((image) {
          images.add(image);
        });
        Map<String, dynamic> campaignCreate = {
          'id': campaignMap['id'],
          'title': campaignMap['title'],
          'description': campaignMap['description'],
          'location': campaignMap['location'],
          'status': campaignMap['status'],
          'creatorId': campaignMap['creatorId'],
          'volunteers': volunteers,
          'startDate': DateTime.parse(campaignMap['startDate'].substring(0, 8) +
              'T' +
              campaignMap['startDate'].substring(8)),
          'endDate': DateTime.parse(campaignMap['endDate'].substring(0, 8) +
              'T' +
              campaignMap['endDate'].substring(8)),
          'actions': actions,
          'chatId': campaignMap['chatId'],
          'comments': comments,
          'images': images
        };
        campaigns.add(Campaign.fromMap(campaignCreate));
      });
      _campaignsList = campaigns;
      notifyListeners();
      return campaigns;
    } catch (e) {
      print(e);
      notifyListeners();
      return null;
    }
  }
}

class UserModel extends ConnectedCampaignModel {
  Future<User> getUser() async {
    print('Entered');
    try {
      String url = 'https://streetv.eu-gb.mybluemix.net/user/login';
      var headers = {'Content-Type': 'application/json'};
      var body = {'userid': 'ayush221b'};

      var response =
          await http.post(url, headers: headers, body: json.encode(body));

      var responseData = json.decode(response.body);
      Map<String, double> location = {
        'latitude': responseData['location']['latitude'],
        'longitude': responseData['location']['longitude'],
      };
      List<String> interests = [];
      responseData['interests'].forEach((element) {
        interests.add(element.toString());
      });
      List<String> campaigns = [];
      responseData['campaigns'].forEach((element) {
        campaigns.add(element.toString());
      });
      Map<String, dynamic> responseMap = {
        'userid': responseData['userid'],
        'name': responseData['name'],
        'age': responseData['age'],
        'location': location,
        'interests': interests,
        'campaigns': campaigns,
        'svPoints': responseData['svPoints'],
        'avatarUrl': responseData['avatarUrl'],
      };
      User user = User.fromMap(responseMap);
      _authenticatedUser = user;
      notifyListeners();

      print(user.userid);

      return user;
    } catch (e) {
      print(e);
      notifyListeners();
      return null;
    }
  }
}

class ActionModel extends ConnectedCampaignModel {}

class ChatMode extends ConnectedCampaignModel {}

class UtilityModel extends ConnectedCampaignModel {
  bool get isLoading {
    return _isLoading;
  }
}
