import 'package:flutter/material.dart';
import 'package:viva/helper/authenticate.dart';
import 'package:viva/screens/account_settings.dart';
import 'package:viva/services/authentication.dart';
import 'package:viva/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthenticationMethods authMethods = new AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: <Widget>[
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountSettings()));
                      },
                      child: settingsItem(
                          'Account Settings', Colors.white70, context)),
                  SizedBox(height: 10),
                  settingsItem('Delete lists', Colors.red[300], context),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      authMethods.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Authenticate()));
                    },
                    child: settingsItem('Sign out', Colors.red[400], context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
