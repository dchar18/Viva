import 'package:flutter/material.dart';
import 'package:viva/screens/settings_screen.dart';

Widget appBarMain(BuildContext context, String title) {
  return AppBar(
    // leading: IconButton(
    //     icon: Icon(Icons.menu),
    //     iconSize: 30.0,
    //     color: Colors.white,
    //     onPressed: () {}),
    title: Text(
      title,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),
    elevation: 0.0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.settings),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        },
      ),
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
