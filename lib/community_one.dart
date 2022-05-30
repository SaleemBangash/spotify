// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/Editing_the_post.dart';

import 'package:spotify/INterests.dart';
import 'package:spotify/Searchbar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/sportsinterest.dart';

import 'bottom_bar.dart';

class CommunityOne extends StatefulWidget {
  const CommunityOne({Key? key}) : super(key: key);

  @override
  _CommunityOneState createState() => _CommunityOneState();
}

class _CommunityOneState extends State<CommunityOne> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool _isBeenPressed = false;
  bool _oneBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Community One",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (BottomBar())));
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/person.png",
                                height: 60,
                                width: 60,
                              ),
                              Text("Kareem",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PopupMenuButton(
                                  onSelected: (result) {
                                    if (result == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Editing()),
                                      );
                                    } else {
                                      if (result == 1) {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           CommunityOne()),
                                        // );
                                      }
                                    }
                                  },
                                  offset: Offset(0, 50),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  icon: Icon(Icons
                                      .more_vert), //don't specify icon if you want 3 dot menu
                                  color: Color.fromARGB(255, 235, 241, 245),
                                  itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          // onTap: (() {
                                          //   Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               Profile()));
                                          // }),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          // onTap: (() {
                                          //   Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               Favourite()));
                                          // }),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text("Delete"),
                                          ),
                                        ),
                                        // PopupMenuItem<int>(
                                        //   value: 1,
                                        //   child: Padding(
                                        //     padding:
                                        //         const EdgeInsets.only(left: 10),
                                        //     child: Text("Share"),
                                        //   ),
                                        // ),
                                      ]))
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
                        "assets/building1.jpg",
                        // height: 90,
                        // width: 460,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                setState(() {
                                  _oneBeenPressed = !_oneBeenPressed;
                                  // _isBeenPressed = false;
                                  // _hasBeenPressed = false;
                                  // _hadBeenPressed = false;
                                })
                              },
                              child: Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: _oneBeenPressed
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Like")
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _playlistModalBottomSheet(context),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.comment),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Comment")
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.share),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Share")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: SizedBox(
                          width: 330,
                          height: 45,
                          child: TextFormField(
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(8.0)),
                                hintText: "Comment",
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            keyboardType: TextInputType.emailAddress,
                          )),
                    )
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/person1.png",
                                height: 60,
                                width: 60,
                              ),
                              Text("Naveed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PopupMenuButton(
                                  onSelected: (result) {
                                    if (result == 0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Editing()));
                                    } else {
                                      if (result == 1) {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           CommunityOne()),
                                        // );
                                      }
                                    }
                                  },
                                  offset: Offset(0, 50),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  icon: Icon(Icons
                                      .more_vert), //don't specify icon if you want 3 dot menu
                                  color: Color.fromARGB(255, 235, 241, 245),
                                  itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          // onTap: (() {
                                          //   Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               Profile()));
                                          // }),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          // onTap: (() {
                                          //   Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               Favourite()));
                                          // }),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text("Delete"),
                                          ),
                                        ),
                                        // PopupMenuItem<int>(
                                        //   value: 1,
                                        //   child: Padding(
                                        //     padding:
                                        //         const EdgeInsets.only(left: 10),
                                        //     child: Text("Share"),
                                        //   ),
                                        // ),
                                      ]))
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
                        "assets/download1.jpg",
                        // height: 60,
                        // width: 60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                setState(() {
                                  _isBeenPressed = !_isBeenPressed;
                                  // _isBeenPressed = false;
                                  // _hasBeenPressed = false;
                                  // _hadBeenPressed = false;
                                })
                              },
                              child: Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: _isBeenPressed
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Like")
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _playlistModalBottomSheet(context),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.comment),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Comment")
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.share),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Share")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Visibility(
                    //   visible: _isVisible,
                    //   child: SizedBox(
                    //       width: 330,
                    //       height: 45,
                    //       child: TextFormField(
                    //         style: TextStyle(height: 1.5),
                    //         decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //                 borderSide: BorderSide(
                    //                     color: Colors.black, width: 2.0),
                    //                 borderRadius: BorderRadius.circular(8.0)),
                    //             hintText: "Comment",
                    //             filled: true,
                    //             contentPadding: EdgeInsets.symmetric(
                    //                 vertical: 10, horizontal: 10)),
                    //         keyboardType: TextInputType.emailAddress,
                    //       )),
                    // ),
                    // SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _playlistModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/download1.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "John Smith",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Hi How Are You",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/person.png",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "John Smith",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Great Work",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/person1.png",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gold Ryan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Awsome Click",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/buildingg.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "NBen Mark",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Nice Comment",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 330,
                          height: 45,
                          child: TextFormField(
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                                // suffixIcon: Icon(
                                //   FontAwesomeIcons.paperPlane,
                                //   color: Colors.black,
                                // ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0)),
                                hintText: "Write a comment...",
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            keyboardType: TextInputType.emailAddress,
                          )),
                    ),
                  ),
                ],
              ));
        });
  }
}
