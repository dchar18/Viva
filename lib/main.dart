import 'package:flutter/material.dart';
import 'package:viva/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        accentColor: Colors.blue[300],
      ),
      home: HomeScreen(),
    );
  }
}