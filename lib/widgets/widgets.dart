import 'package:flutter/material.dart';
import 'package:viva/screens/settings_screen.dart';

Widget appBarMain(BuildContext context, String title) {
  return AppBar(
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
