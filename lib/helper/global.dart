import 'package:flutter/material.dart';
import 'package:viva/screens/chatroom_screen.dart';
import 'package:viva/screens/discover_screen.dart';
import 'package:viva/screens/profile_screen.dart';
import 'package:viva/screens/savedList_screen.dart';

class Global {
  final List<Widget> views = [
    DiscoverScreen(),
    SavedListScreen(),
    ChatRoomScreen(),
    ProfileScreen(),
  ];

  int currViewIndex = 0; // keeps track of index of currently selected
}
