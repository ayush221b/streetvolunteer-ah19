import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:streetvolunteer_ah19/app/models/campaign.dart';
import 'package:streetvolunteer_ah19/app/models/chat.dart';
import 'package:streetvolunteer_ah19/app/pages/drawer.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';

class ChatPage extends StatefulWidget {
  final Campaign campaign;
  final MainModel model;

  const ChatPage({Key key, this.campaign, this.model}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController chatMessageController = TextEditingController();
  Chat _chat;
  @override
  void initState() {
    getChatForCampaign();
    super.initState();
  }

  Future getChatForCampaign() async {
    Chat chat = await widget.model.getChat(widget.campaign.chatId);
    setState(() {
      _chat = chat;
    });
  }

  Future sendMessage(Map<String, String> message) async {
    Chat chat =
        await widget.model.sendChatMessage(widget.campaign.chatId, message);
    setState(() {
      _chat = chat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.campaign.title,
          style: TextStyle(color: Color(0xFF014656)),
        ),
        backgroundColor: Colors.white24,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF014656)),
      ),
      body: _chat == null
          ? Center(child: Text('Loading Messages...'))
          : Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: _chat.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, String> message = _chat.messages[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          elevation: 0,
                          child: Container(
                              child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: message['userid'] !=
                                    widget.model.authUser.userid
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: <Widget>[
                              CircleAvatar(
                                child: Text(message['userid'][0].toUpperCase(), style: TextStyle(color: Colors.white),),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(message['userid'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                  ),
                                  Text(message['message']),
                                ],
                              )
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                    height: 100.0,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            controller: chatMessageController,
                            decoration: InputDecoration(
                                hintText: 'Send a message',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                              onTap: () async {
                                Map<String, String> message = {
                                  'userid': widget.model.authUser.userid,
                                  'message': chatMessageController.text
                                };
                                await sendMessage(message);
                                chatMessageController.clear();
                              },
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ))
              ],
            ),
    );
  }
}
