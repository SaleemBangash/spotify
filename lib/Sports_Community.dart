// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/Searchbar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/sportsinterest.dart';

class sportscommunity extends StatefulWidget {
  const sportscommunity({Key? key}) : super(key: key);

  @override
  _sportscommunityState createState() => _sportscommunityState();
}

class _sportscommunityState extends State<sportscommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sports Community",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (Login())));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                // Container(
                //   child: ListView(
                //     shrinkWrap: true,
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage("assets/download.png"),
                //                 fit: BoxFit.fill)),
                //         child: ListTile(
                //           title: Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   Container(
                //                       height: 40,
                //                       width: 90,
                //                       child: Image.asset("assets/download.png")),
                //                   Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         "Sports Community",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 25),
                //                       ),
                //                       SizedBox(
                //                         height: 10,
                //                       ),
                //                       Container(
                //                         child: Text("50K"),
                //                       ),
                //                       Row(
                //                         children: [
                //                           Container(
                //                             child: Center(
                //                               child: Text("Join",
                //                                   style: TextStyle(
                //                                       fontSize: 15,
                //                                       color: Colors.white,
                //                                       fontWeight: FontWeight.bold)),
                //                             ),
                //                             color: Colors.green,
                //                             width: 30,
                //                           ),
                //                           SizedBox(
                //                             width: 20,
                //                           ),
                //                           Container(
                //                             child: Center(
                //                               child: Text("Member",
                //                                   style: TextStyle(
                //                                       fontSize: 15,
                //                                       color: Colors.white,
                //                                       fontWeight: FontWeight.bold)),
                //                             ),
                //                             color: Colors.green,
                //                             width: 100,
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/person.png",
                            height: 60,
                            width: 60,
                          ),
                          Text("Player 1",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: Text("Good Will send you some suggestions. ",
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/house.jpg",
                        // height: 60,
                        // width: 60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.thumbsUp),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Like")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.comment),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Comment")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.edit),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Edit")
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Divider(
                  thickness: 5,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/person1.png",
                            height: 60,
                            width: 60,
                          ),
                          Text("Player 2",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(
                          "Hello Hope you are doing well. Stay in touch for further updates",
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/house.jpg",
                        // height: 60,
                        // width: 60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.thumbsUp),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Like")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.comment),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Comment")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.edit),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Edit")
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
