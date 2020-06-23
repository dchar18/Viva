import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0;
  final List<IconData> views = [Icons.card_travel, Icons.bookmark, Icons.forum, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.grey[100],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: views.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}