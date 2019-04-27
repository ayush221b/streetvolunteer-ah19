/*
Id - chat_id (String)
Campaign_id : String
Messages: Map<String, dynamic> : Keys::Sender, Message, Date/time
*/

class Chat {
  String id;
  String campaignId;
  List<Map<String, dynamic>> messages;

  Chat(
    this.campaignId,
    this.id,
    this.messages
  );

  Chat.fromMap(Map<String, dynamic> map) {

    id = map['id'];
    campaignId = map['campaignId'];
    messages = map['messages'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['campaignId'] = campaignId;
    map['messages'] = messages;
    return map;
  }
}
