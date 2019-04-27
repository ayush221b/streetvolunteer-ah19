import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:streetvolunteer_ah19/app/pages/drawer.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Campaign Name",
          style: TextStyle(color: Color(0xFF014656)),
        ),
        backgroundColor: Colors.white24,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF014656)),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];
  void _handleSubmitted(String text) {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.black,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Send Message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: CircleAvatar(
                backgroundColor: Color(0xFF014656),
                radius: 25,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),

        //This container places the send message thing in the bottom
        Container(
          color: Colors.white24,
          padding: EdgeInsets.only(bottom: 8),
          child: _textComposer(),
        )
      ],
    );
  }
}

const String _name = "Pratik";

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0xFF014656),
              child: Center(
                  child: Text(
                _name[0],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
