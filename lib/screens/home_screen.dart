import 'package:flutter/material.dart';
import 'package:viva/screens/profile.dart';
import 'package:viva/widgets/suggested.dart';
// import 'package:viva/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // keeps track of index of currently selected
  final List<Widget> _children = [
    SuggestedWidget(),
    SuggestedWidget(),
    SuggestedWidget(),
    ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white, 
          onPressed: () {}
        ),
        title: Text(
          'Viva',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  _children[_currentIndex],
                ],
              ),
              // child: _children[_currentIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.grey[700],
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.card_travel),
            title: new Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.bookmark),
            title: new Text('Saved'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}