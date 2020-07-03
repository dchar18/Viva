import 'package:flutter/material.dart';
import 'package:viva/screens/forgotPassword_screen.dart';
import 'package:viva/screens/home_screen.dart';
import 'package:viva/screens/signup_screen.dart';
import 'package:viva/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
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
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
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
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // signIn(); // TODO
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
