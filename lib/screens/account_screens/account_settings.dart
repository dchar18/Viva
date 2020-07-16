import 'package:flutter/material.dart';
import 'package:viva/widgets/widgets.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Account Settings',
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: <Widget>[
                    SizedBox(height: 10),
                    settingsItem('Change username', Colors.white70, context),
                    SizedBox(height: 10),
                    settingsItem('Update email', Colors.white70, context),
                    SizedBox(height: 10),
                    settingsItem(
                        'Manage Notifications', Colors.white70, context),
                    SizedBox(height: 10),
                    settingsItem('Change username', Colors.white70, context),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
