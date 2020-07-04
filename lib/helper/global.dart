import 'package:flutter/material.dart';
import 'package:viva/screens/chatroom_screen.dart';
import 'package:viva/screens/discover_screen.dart';
import 'package:viva/screens/profile_screen.dart';
import 'package:viva/screens/savedList_screen.dart';

class Global {
  // used to store the user's name
  static String myName = "";

  // list of main views (widgets) that are accessed from the navigation bar
  final List<Widget> views = [
    DiscoverScreen(),
    SavedListScreen(),
    ChatRoomScreen(),
    ProfileScreen(),
  ];

  // list of titles displaced in the app bar when each widget from "views" is accessed
  final List<String> titles = ["Discover", "Saved Lists", "Chats", "Profile"];

  int currViewIndex = 0; // keeps track of index of the view currently selected
}
