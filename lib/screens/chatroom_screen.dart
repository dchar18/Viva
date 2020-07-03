import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text('Chats'),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String chatroomID;
  ChatTile(this.name, this.chatroomID);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
