// This widget contains all the active chats
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
        // padding: EdgeInsets.only(top: 10),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: <Widget>[
            SizedBox(height: 10),
            ChatTile('George', '0'),
            SizedBox(height: 10),
            ChatTile('Kevin', '0'),
            SizedBox(height: 10),
            ChatTile('Lucy', '0'),
            SizedBox(height: 10),
            ChatTile('Timothy', '0'),
            SizedBox(height: 10),
            ChatTile('Steven', '0'),
            SizedBox(height: 10),
            ChatTile('Karen', '0'),
            SizedBox(height: 10),
            ChatTile('Bob', '0'),
            SizedBox(height: 10),
            ChatTile('Ruth', '0'),
            SizedBox(height: 10),
            ChatTile('Dorothy', '0'),
            SizedBox(height: 10),
            ChatTile('Joe', '0'),
          ],
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
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).accentColor,
            ),
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            name,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
