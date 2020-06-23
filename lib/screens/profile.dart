import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
    @override
    _ProfileWidgetState createState() => _ProfileWidgetState();
  }

  class _ProfileWidgetState extends State<StatefulWidget>{
    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      );
    }
  }