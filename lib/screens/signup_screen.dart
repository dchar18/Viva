import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viva/helper/global.dart';
import 'package:viva/helper/sharedPreference_functions.dart';
import 'package:viva/screens/home_screen.dart';
import 'package:viva/screens/signin_screen.dart';
import 'package:viva/services/authentication.dart';
import 'package:viva/services/database.dart';
import 'package:viva/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggle;
  SignUpScreen(this.toggle);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthenticationMethods authMethods = new AuthenticationMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  bool isLoading =
      false; // used to determine if loading animation should be showed

  signUp() {
    if (formKey.currentState.validate()) {
      String usernameInput = usernameEditingController.text;
      String emailInput = emailEditingController.text;
      String passwordInput = passwordEditingController.text;

      // create a map of new user's info
      Map<String, String> userInfoMap = {
        'name': usernameInput,
        'email': emailInput
      };

      setState(() {
        isLoading = true;
      });

      // add user info to shared preferences
      Functions.saveUserNameSharedPreference(usernameInput);
      Functions.saveUserEmailSharedPreference(emailInput);

      authMethods
          .signUpWithEmailPassword(emailInput, passwordInput)
          .then((value) {
        // add user to database
        databaseMethods.uploadUserInfo(userInfoMap);

        Functions.saveUserLoggedInSharedPreference(true);
        Functions.saveUserNameSharedPreference(usernameInput);
        Functions.saveUserEmailSharedPreference(emailInput);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                return value.isEmpty || value.length < 4
                                    ? "Please provide a valid username"
                                    : null;
                              },
                              controller: usernameEditingController,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: inputDecoration('Username'),
                            ),
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please provide a valid email";
                              },
                              controller: emailEditingController,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: inputDecoration('Email'),
                            ),
                            TextFormField(
                              validator: (value) {
                                return value.length > 7
                                    ? null
                                    : "Please provide a valid password with 8 or more characters";
                              },
                              controller: passwordEditingController,
                              obscureText: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: inputDecoration('Password'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // vertical
                        children: <Widget>[
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Sign in now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
