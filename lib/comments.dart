// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:spotify/bottom_bar.dart';
import 'package:spotify/sportsinterest.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
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
            "Comment",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/download.png"),
              //           fit: BoxFit.fill)),
              //   child: ListTile(
              //     title: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Container(
              //                 height: 90,
              //                 width: 90,
              //                 child: Image.asset("assets/download.png")),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Player 1",
              //                   style: TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 25),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Row(
              //                   children: [
              //                     Container(
              //                       child: Center(
              //                         child: Text("Follow",
              //                             style: TextStyle(
              //                                 fontSize: 30,
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.bold)),
              //                       ),
              //                       color: Colors.green,
              //                       width: 100,
              //                     ),
              //                     SizedBox(
              //                       width: 20,
              //                     ),
              //                     Container(
              //                       child: Center(
              //                         child: Text("Offer",
              //                             style: TextStyle(
              //                                 fontSize: 30,
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.bold)),
              //                       ),
              //                       color: Colors.green,
              //                       width: 100,
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
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
                          Text(
                            "Post",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Follower",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Followings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Player 2",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                  "Hello Hope you are doing well. Stay in touch for further updates"
                                  "Hello Hope you are doing well. Stay in touch for further updates",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
        ));
  }
}
