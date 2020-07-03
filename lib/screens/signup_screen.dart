import 'package:flutter/material.dart';
import 'package:viva/screens/home_screen.dart';
import 'package:viva/screens/signin_screen.dart';
import 'package:viva/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
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
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      decoration: inputDecoration('Email'),
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.length > 8
                            ? null
                            : "Please provide a valid password with 8 or more characters";
                      },
                      controller: passwordEditingController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      decoration: inputDecoration('Password'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // signIn(); // TODO
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
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
                      // widget.toggle();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
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
    );
  }
}
