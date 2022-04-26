// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotify/Sports_Community.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/registration.dart';
import 'package:spotify/sportsinterest.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back !",
                style: TextStyle(
                    fontSize: 33.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.lightGreen),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                    width: 290,
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Email",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 290,
                  height: 45,
                  child: TextFormField(
                    style: TextStyle(height: 1.5),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Password",
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (interestedsports())));
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    "SignIn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Registration())));
                },
                child: Text(
                  "Create account",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
