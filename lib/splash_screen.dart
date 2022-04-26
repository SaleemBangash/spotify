// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotify/login.dart';
import 'package:spotify/registration.dart';

import 'Editing_the_post.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  double value = 0;
  @override
  // void initState() {
  //   _load();
  //   super.initState();
  // }

  // @override
  // void initState() {
  //   _controller ??= AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 10),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   _controller?.repeat();
  //   _load();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller?.dispose();
  //   super.dispose();
  // }

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Login())));
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

  // _load() {
  //   Future.delayed(const Duration(milliseconds: 6000), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (_) => Registration()));
  //   });
  // }

  // void downloadData() {
  //   new Timer.periodic(Duration(seconds: 1), (Timer timer) {
  //     setState(() {
  //       if (value == 1) {
  //         timer.cancel();
  //       } else {
  //         value = value + 0.1;
  //       }
  //     });
  //   });
  // }
}
