import 'package:flutter/material.dart';
import 'package:viva/screens/signin_screen.dart';
import 'package:viva/screens/signup_screen.dart';

// Reference 1 - begin
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(toggleView);
    } else {
      return SignUpScreen(toggleView);
    }
  }
}
// Reference 1 - end
