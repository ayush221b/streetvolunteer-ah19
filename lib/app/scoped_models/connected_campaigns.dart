import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:streetvolunteer_ah19/app/models/campaign.dart';
import 'package:streetvolunteer_ah19/app/models/chat.dart';
import 'package:streetvolunteer_ah19/app/models/user.dart';
import 'package:geolocator/geolocator.dart';

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

  Future<String> getLocationName(Map<String, double> location) async {
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(location['latitude'], location['longitude']);
    print(placemark[0].locality);
    return placemark[0].locality;
  }

  Future<Chat> sendChatMessage(String id, Map<String, String> message) async {
    print('Entered Chat Message');
    try {
      String url = 'https://streetv.eu-gb.mybluemix.net/chat/sendMessage';
      var headers = {'Content-Type': 'application/json'};
      var body = {
        'id': id,
        'message':message
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(body));

      var responseData = json.decode(response.body);
      print(responseData);
      List<Map<String, String>> messages = [];
      responseData['messages'].forEach((message) {
        messages
            .add({"message": message['message'], "userid": message['userid']});
      });
      Map<String, dynamic> chatMap = {
        'id': responseData['id'],
        'campaignId': responseData['campaignId'],
        'messages': messages.reversed.toList()
      };
      Chat chat = Chat.fromMap(chatMap);
      return chat;
    } catch (e) {
      print(e);
      notifyListeners();
      return null;
    }
  }

  Future<Chat> getChat(String id) async {
    print('Entered Chat');
    try {
      String url = 'https://streetv.eu-gb.mybluemix.net/chat/getChat';
      var headers = {'Content-Type': 'application/json'};
      var body = {
        'id': id,
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(body));

      var responseData = json.decode(response.body);
      print(responseData);
      List<Map<String, String>> messages = [];
      responseData['messages'].forEach((message) {
        messages
            .add({"message": message['message'], "userid": message['userid']});
      });
      Map<String, dynamic> chatMap = {
        'id': responseData['id'],
        'campaignId': responseData['campaignId'],
        'messages': messages.reversed.toList()
      };
      Chat chat = Chat.fromMap(chatMap);
      return chat;
    } catch (e) {
      print(e);
      notifyListeners();
      return null;
    }
  }
}

class CampaignsModel extends ConnectedCampaignModel {
  Future<List<Campaign>> getCampaigns() async {
    List<Campaign> campaigns = [];
    print('Entered Campaigns');
    try {
      String url = 'https://streetv.eu-gb.mybluemix.net/campaign/getnearby';
      var headers = {'Content-Type': 'application/json'};
      var body = {
        'category': "Disaster Recovery",
        'location': {"latitude": 13.0500, "longitude": 80.2121}
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(body));

      var responseData = json.decode(response.body)['campaigns'];
      print(responseData);
      for (int i = 0; i < responseData.length; i++) {
        var campaignMap = responseData[i];
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
        String locationName = await getLocationName(location);
        print(campaignMap['category']);
        Map<String, dynamic> campaignCreate = {
          'id': campaignMap['id'],
          'title': campaignMap['title'],
          'description': campaignMap['description'],
          'location': location,
          'locationName': locationName,
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
          'images': images,
          'category': campaignMap['category']
        };
        campaigns.add(Campaign.fromMap(campaignCreate));
      }
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
