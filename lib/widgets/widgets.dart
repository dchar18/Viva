import 'package:flutter/material.dart';
import 'package:viva/screens/settings_screen.dart';

Widget appBarMain(BuildContext context, String title) {
  // return AppBar(
  //   title: Text(
  //     title,
  //     style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
  //   ),
  // );

  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {}),
    title: Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
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
