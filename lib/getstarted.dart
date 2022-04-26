// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spotify/Editing_the_post.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/hithere.dart';
import 'package:spotify/main.dart';
import 'package:spotify/registration.dart';

class getstartedd extends StatelessWidget {
  const getstartedd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 130),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        image: AssetImage("assets/images.png"))),
                constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                padding: const EdgeInsets.only(left: 120.0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sportify",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Registration())));
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
                    "Get Started",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
