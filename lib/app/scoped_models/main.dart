import 'package:scoped_model/scoped_model.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/connected_campaigns.dart';


// ignore: mixin_inherits_from_not_object
class MainModel extends Model with ConnectedCampaignModel,UserModel, CampaignsModel, UtilityModel{}