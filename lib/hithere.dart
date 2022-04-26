// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Community.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/health.dart';
import 'package:spotify/profile.dart';

class Hithere extends StatelessWidget {
  const Hithere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff272525),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (BottomBar())));
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          "Hi There",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                Text("Let's Help you to get started !",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 25,
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
                          hintText: "FullName",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
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
                          hintText: "Email",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
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
                          hintText: "Password",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
                    )),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Interests())));
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
