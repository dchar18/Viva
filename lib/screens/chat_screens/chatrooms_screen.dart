// This widget contains all the active chats
import 'package:flutter/material.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/helper/sharedPreference_functions.dart';
import 'package:viva/services/authentication.dart';
import 'package:viva/services/database.dart';
import 'package:viva/widgets/widgets.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();

  // ignore: deprecated_member_use
  // static _ChatRoomScreenState of(BuildContext context) =>
  //     context.findAncestorStateOfType();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  bool showSearch = false;
  TextEditingController searchEditingController = new TextEditingController();

  AuthenticationMethods authMethods = new AuthenticationMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomsStream;

  refresh() {
    setState(() {
      showSearch = Global.chat_searching;
    });
  }

  // Reference 1 - begin
  Widget chatroomList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                      snapshot.data.documents[index].data["chatroomID"]
                          .toString()
                          .replaceAll("_", "")
                          .replaceFirst(Global.myName, ""),
                      snapshot.data.documents[index].data["chatroomID"]);
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Global.myName = await Functions.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Global.myName).then((val) {
      setState(() {
        chatRoomsStream = val;
      });
    });

    setState(() {});
  }
  // Reference 1 - end

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            chatSearchBar(context, searchEditingController),
            SizedBox(
              height: 10,
            ),
            chatroomList(),
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
              color: Colors.grey[50],
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
