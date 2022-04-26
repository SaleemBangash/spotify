// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/sportsinterest.dart';

class Registration extends StatefulWidget {
  const Registration({
    Key? key,
  }) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
                        hintText: "Name",
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    keyboardType: TextInputType.text,
                  )),
              SizedBox(
                height: 20,
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
                        hintText: "Confirm Password",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Login())));
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
                    "SignUp",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Login())));
                },
                child: Text(
                  "SignIn",
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
