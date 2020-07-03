import 'package:flutter/material.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<StatefulWidget> {
  String title = 'Saved Lists';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
