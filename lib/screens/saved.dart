import 'package:flutter/material.dart';

class SavedWidget extends StatefulWidget {
    @override
    _SavedWidgetState createState() => _SavedWidgetState();
  }

  class _SavedWidgetState extends State<StatefulWidget>{
    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      );
    }
  }