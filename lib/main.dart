import 'package:flutter/material.dart';
import 'package:viva/helper/authenticate.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/helper/sharedPreference_functions.dart';
import 'package:viva/screens/home_screen.dart';
import 'package:viva/screens/signin_screen.dart';
import 'package:viva/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn;

  // Reference 1 - begin
  @override
  void initState() {
    getLoggedInState();
    getUsername(); // retreive global variable data from shared preference
    getEmail();
    super.initState();
  }

  getLoggedInState() async {
    await Functions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }
  // Reference 1 - end

  getUsername() async {
    await Functions.getUserNameSharedPreference().then((value) {
      Global.myName = value;
    });
  }

  getEmail() async {
    await Functions.getUserEmailSharedPreference().then((value) {
      Global.myEmail = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        accentColor: Colors.blue[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: WelcomeScreen(),
      home: isLoggedIn != null
          ? (isLoggedIn ? HomeScreen() : Authenticate())
          : Container(
              child: Center(
                child: Authenticate(),
              ),
            ),
    );
  }
}
