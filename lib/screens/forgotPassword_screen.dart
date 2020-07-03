import 'package:flutter/material.dart';
import 'package:viva/widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, 'Forgot Password'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text('Lol not here yet'),
      ),
    );
  }
}
