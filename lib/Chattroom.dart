// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/sportsinterest.dart';

import 'health.dart';

class chatt extends StatelessWidget {
  const chatt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        //         Column(
        //           children: [Icon(Icons.save), Text("save")],
        //         ),
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

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (interestedsports())));
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            "Chat",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "9:00pm",
                        style: TextStyle(
                            fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Can I Ask You a question"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "9:00pm",
                        style: TextStyle(
                            fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Can I Ask You a question"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "9:00pm",
                        style: TextStyle(
                            fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Can I Ask You a question"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "9:00pm",
                        style: TextStyle(
                            fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Can I Ask You a question"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "9:00pm",
                        style: TextStyle(
                            fontSize: 15.0, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Can I Ask You a question"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      suffixIcon: Icon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.black,
                      ),
                      filled: true,

                      fillColor: Colors.grey[200],
                      // icon: Icon(Icons.phone),
                      hintText: "Type Something",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
