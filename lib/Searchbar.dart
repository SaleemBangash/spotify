// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/sportsinterest.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
          title: Text("Search Here", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (interestedsports())));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                //Search baar
                SizedBox(
                    width: 310,
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Search",
                          filled: true,
                          suffixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.emailAddress,
                    )),

                //perfect container
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/download.png",
                                  width: 50,
                                  height: 50,
                                ),
                                Text("Cricket")
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/download.png",
                                width: 50,
                                height: 50,
                              ),
                              Text("FootBall")
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/download.png",
                                  width: 50,
                                  height: 50,
                                ),
                                Text("Cricket")
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/download.png",
                                width: 50,
                                height: 50,
                              ),
                              Text("Hockey")
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/download.png",
                                  width: 50,
                                  height: 50,
                                ),
                                Text("Tennis")
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/download.png",
                                width: 50,
                                height: 50,
                              ),
                              Text("BasketBall")
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchBar())));
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Container(
                //   width: 100,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.black,
                //       width: 1,
                //     ),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       //textt///////////

                //       Container(
                //         child: Row(
                //           children: [
                //             Container(
                //                 height: 50,
                //                 width: 50,
                //                 child: Image.asset("assets/download.png")),
                //             Text("Sport 1")
                //           ],
                //         ),
                //       )
                //       //button
                //       ,
                //       // Container(
                //       //     padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                //       //     height: 50,
                //       //     width: 90,
                //       //     child: RaisedButton(
                //       //       onPressed: () {
                //       //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>(community())));
                //       //       },
                //       //       color: Colors.blueGrey,
                //       //       shape: RoundedRectangleBorder(
                //       //           borderRadius: BorderRadius.circular(10)),
                //       //       child: Center(
                //       //         child: Text("+ Join ",
                //       //             style: TextStyle(color: Colors.white)),
                //       //       ),
                //       //     ))
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
