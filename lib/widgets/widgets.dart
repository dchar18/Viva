import 'package:flutter/material.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/screens/addItemScreen.dart';
import 'package:viva/screens/chatrooms_screen.dart';
import 'package:viva/screens/settings_screen.dart';

Widget appBarMain(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),
    elevation: 0.0,
    actions: <Widget>[
      title == 'Profile'
          ? IconButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            )
          : (title == 'Chats')
              ? IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {
                    Global.chat_searching = !(Global.chat_searching);

                    // ChatRoomScreen.of(context).refresh();
                    // ChatRoomScreen.refresh();
                  },
                )
              // : (title == 'Saved Lists')
              //     ? IconButton(
              //         padding: EdgeInsets.symmetric(horizontal: 10),
              //         icon: Icon(Icons.add),
              //         iconSize: 30.0,
              //         color: Colors.white,
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => AddItemScreen(),
              //             ),
              //           );
              //         },
              //       )
              : Container(),
    ],
  );
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

TextStyle standardStyle(double textSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: textSize,
  );
}

Container settingsItem(String text, Color color, context) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    child: Text(text,
        style: color == Colors.white70
            ? TextStyle(color: Colors.grey[700], fontSize: 20)
            : standardStyle(20)),
  );
}

Widget chatSearchBar(context, editingController) {
  return Container(
    height: 75,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.blue[900],
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editingController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search username",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        // Image.asset("name"),
        GestureDetector(
          onTap: () {
            context.initiateSearch();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search, color: Colors.white),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [const Color(0x36ffffff), const Color(0x0fffffff)]),
                borderRadius: BorderRadius.circular(40)),
          ),
        ),
      ],
    ),
  );
}
