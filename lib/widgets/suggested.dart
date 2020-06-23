import 'package:flutter/material.dart';

class SuggestedWidget extends StatefulWidget {
    @override
    _SuggestedWidgetState createState() => _SuggestedWidgetState();
  }

  class _SuggestedWidgetState extends State<StatefulWidget>{
    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      );
    }
  }