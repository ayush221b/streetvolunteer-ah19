import 'package:scoped_model/scoped_model.dart';

class ConnectedCampaignModel extends Model {
  bool _isLoading;
}

class CampaignsModel extends ConnectedCampaignModel {}

class UserModel extends ConnectedCampaignModel {}

class ActionModel extends ConnectedCampaignModel {}

class ChatMode extends ConnectedCampaignModel {}

class UtilityModel extends ConnectedCampaignModel {
  bool get isLoading {
    return _isLoading;
  }
}
