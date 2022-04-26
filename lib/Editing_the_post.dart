// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Community.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/Sports_Community.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/getstarted.dart';
import 'package:spotify/sportsinterest.dart';

class Editing extends StatefulWidget {
  const Editing({Key? key}) : super(key: key);

  @override
  _EditingState createState() => _EditingState();
}

class _EditingState extends State<Editing> {
  get bottomNavigationBar => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Editing Post"),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => BottomBar())));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //     decoration: BoxDecoration(
      //       border: Border.all(
      //           color: Colors.black, //color of border
      //           width: 2),
      //     ),
      //     height: 50,
      //     width: MediaQuery.of(context).size.width,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Column(
      //           children: [Icon(Icons.home), Text("home")],
      //         ),
      //         //SizedBox(width: 30,),
      //         Column(
      //           children: [Icon(Icons.search), Text("search")],
      //         ),
      //         //SizedBox(width: 30,),

      //         //SizedBox(width: 30,),
      //         Column(
      //           children: [Icon(Icons.chat), Text("chat")],
      //         ),
      //         // SizedBox(width: 30,),
      //         Column(
      //           children: [Icon(Icons.person), Text("profile")],
      //         ),
      //       ],
      //     )),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 180),
                child: Text(
                  "Add Title Here",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Center(
                child: SizedBox(
                    width: 290,
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: Colors.black, width: 2.0),
                          //     borderRadius: BorderRadius.circular(15)),
                          hintText: "Write Post",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Interests())));
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
                    "Ok",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
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
                          builder: (context) => (interestedsports())));
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
                    "Cancel",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
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
                          builder: (context) => (interestedsports())));
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
                    "Add Photo",
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
    );
  }
}
