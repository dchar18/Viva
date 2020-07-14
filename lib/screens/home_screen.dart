import 'package:flutter/material.dart';
import 'package:viva/screens/addItemScreen.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/widgets/widgets.dart';
// import 'package:viva/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Global constants = new Global();
  // GlobalKey<ChatRoomScreen> key = new GlobalKey<ChatRoomScreen>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarMain(context, constants.titles[constants.currViewIndex]),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
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
                    Global.views[constants.currViewIndex],
                  ],
                ),
                // child: _children[_currentIndex],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: (constants.currViewIndex == 1)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                print("Name: " + Global.myName);
                print("Email: " + Global.myEmail);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddItemScreen()));
              },
            )
          : null,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Theme.of(context).primaryColor,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.black)),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue[600],
          unselectedItemColor: Colors.grey[700],
          onTap: onTabTapped,
          currentIndex: constants
              .currViewIndex, // this will be set when a new tab is tapped
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
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      constants.currViewIndex = index;
    });
  }
}
