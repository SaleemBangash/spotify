// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/Community.dart';
import 'package:spotify/Editing_the_post.dart';

import 'package:spotify/Searchbar.dart';
import 'package:spotify/Sports_Community.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/comments.dart';
import 'package:spotify/health.dart';
import 'package:spotify/hithere.dart';
import 'package:spotify/main.dart';
import 'package:spotify/profile.dart';
import 'package:spotify/registration.dart';

class interestedsports extends StatelessWidget {
  const interestedsports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Registration())));
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            "Sports Interests",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Interests",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Community())));
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "Cricket",
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
                        MaterialPageRoute(builder: (context) => (Comments())));
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "FootBall",
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
                        MaterialPageRoute(builder: (context) => (Editing())));
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "BasketBall",
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
                        MaterialPageRoute(builder: (context) => (Health())));
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "Tennis",
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
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (BottomBar())));
                  },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "Ok",
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
              ],
            ),
          ),
        ));
  }
}
