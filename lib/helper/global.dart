import 'package:flutter/material.dart';
import 'package:viva/screens/chat_screens/chatrooms_screen.dart';
import 'package:viva/screens/discover_screen.dart';
import 'package:viva/screens/account_screens/profile_screen.dart';
import 'package:viva/screens/savedList_screen.dart';

class Global {
  // used to store the user's name
  static String myName = "";
  static String myEmail = "";
  static bool chat_searching =
      false; // used to determine if search bar should be active for chats

  // list of main views (widgets) that are accessed from the navigation bar
  static List<Widget> views = [
    DiscoverScreen(),
    SavedListScreen(),
    ChatRoomScreen(),
    ProfileScreen(),
  ];

  // list of titles displaced in the app bar when each widget from "views" is accessed
  final List<String> titles = ["Discover", "Saved Lists", "Chats", "Profile"];

  int currViewIndex = 0; // keeps track of index of the view currently selected
}
