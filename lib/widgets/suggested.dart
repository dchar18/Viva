import 'package:flutter/material.dart';

class SuggestedWidget extends StatefulWidget {
  @override
  _SuggestedWidgetState createState() => _SuggestedWidgetState();
}

class _SuggestedWidgetState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text('Suggested'),
        ),
      ),
    );
  }
}
