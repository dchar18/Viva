import 'package:flutter/material.dart';
import 'package:viva/helper/authenticate.dart';
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
      home: WelcomeScreen(),
      // home: isLoggedIn != null
      //     ? (isLoggedIn ? HomeScreen() : Authenticate())
      //     : Container(
      //         child: Center(
      //           child: Authenticate(),
      //         ),
      //       ),
    );
  }
}
