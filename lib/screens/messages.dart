import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
    @override
    _MessagesWidgetState createState() => _MessagesWidgetState();
  }

  class _MessagesWidgetState extends State<StatefulWidget>{
    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      );
    }
  }