// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:spotify/bottom_bar.dart';
import 'package:spotify/create_community_post.dart';

import 'package:spotify/login.dart';
import 'package:spotify/show_community_post.dart';
import 'package:spotify/variables/variables.dart';

import 'Community.dart';
import 'models/interest_model.dart';

class interestedsports extends StatefulWidget {
  const interestedsports({Key? key}) : super(key: key);

  @override
  State<interestedsports> createState() => _interestedsportsState();
}

class _interestedsportsState extends State<interestedsports> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInterestData();
  }

  String intrestID = '';
  var selected = 0;
  bool _hasBeenPressed = false;

  bool _isBeenPressed = false;

  bool _wasBeenPressed = false;
  bool _hadBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Login())));
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
        body: interestList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Interests",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    _hadBeenPressed = !_hadBeenPressed;
                                    _isBeenPressed = false;
                                    _wasBeenPressed = false;
                                    _hasBeenPressed = false;
                                    intrestID = interestList[0].id;
                                  }),
                                },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: _hadBeenPressed
                                      ? Colors.orangeAccent
                                      : Colors.cyan,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                interestList[0].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    color: Colors.white),
                              )),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    _isBeenPressed = !_isBeenPressed;
                                    _hadBeenPressed = false;
                                    _wasBeenPressed = false;
                                    _hasBeenPressed = false;
                                    intrestID = interestList[1].id;
                                  })
                                },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: _isBeenPressed
                                      ? Colors.orangeAccent
                                      : Colors.cyan,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                interestList[1].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    color: Colors.white),
                              )),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    _wasBeenPressed = !_wasBeenPressed;
                                    _isBeenPressed = false;
                                    _hadBeenPressed = false;
                                    _hasBeenPressed = false;
                                    intrestID = interestList[2].id;
                                  })
                                },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: _wasBeenPressed
                                      ? Colors.orangeAccent
                                      : Colors.cyan,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                interestList[2].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    color: Colors.white),
                              )),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    _hasBeenPressed = !_hasBeenPressed;
                                    _isBeenPressed = false;
                                    _wasBeenPressed = false;
                                    _hadBeenPressed = false;
                                    intrestID = interestList[3].id;
                                  })
                                },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: _hasBeenPressed
                                      ? Colors.orangeAccent
                                      : Colors.cyan,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                interestList[3].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    color: Colors.white),
                              )),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (BottomBar())));
                                  print(intrestID);
                                  saveInterest(intrestID);
                                },
                                child: Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Ok",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 17,
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => Community(
                              //                   interest_id: interestList[0].id,
                              //                 )));
                              //   },
                              //   child: Text(
                              //     "Create Community",
                              //     style: TextStyle(
                              //         fontSize: 17.0,
                              //         fontStyle: FontStyle.normal,
                              //         color: Colors.black),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 CreateCommunityPost()));
                              //   },
                              //   child: Text(
                              //     "Create Community Post",
                              //     style: TextStyle(
                              //         fontSize: 17.0,
                              //         fontStyle: FontStyle.normal,
                              //         color: Colors.black),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // GestureDetector(
                              //   onTap: () {
                              //     // Navigator.push(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //         builder: (context) => ShowCommunityPost()));
                              //   },
                              //   child: Text(
                              //     "Show Community Post",
                              //     style: TextStyle(
                              //         fontSize: 17.0,
                              //         fontStyle: FontStyle.normal,
                              //         color: Colors.black),
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ],

                      // Column(
                      //     children: [
                      //       SizedBox(
                      //         height: 30,
                      //       ),
                      //       Text(
                      //         "Your Interests",
                      //         style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      //       ),
                      //       SizedBox(
                      //         height: 30,
                      //       ),
                      //       Expanded(
                      //         child: ListView.builder(
                      //           itemCount: interestList.length,
                      //           itemBuilder: (context, index) {
                      //             return Column(
                      //               children: [
                      //                 GestureDetector(
                      //                     onTap: () => {
                      //                           setState(() {
                      //                             selected = index;
                      //                           })
                      //                         },
                      //                     child: Container(
                      //                       height: 40,
                      //                       width: 180,
                      //                       decoration: BoxDecoration(
                      //                           color: selected == index
                      //                               ? Colors.orangeAccent
                      //                               : Colors.cyan,
                      //                           borderRadius: BorderRadius.circular(10.0)),
                      //                       child: Center(
                      //                           child: Text(
                      //                         interestList[index].name,
                      //                         style: TextStyle(
                      //                             fontWeight: FontWeight.bold,
                      //                             fontStyle: FontStyle.normal,
                      //                             fontSize: 17,
                      //                             color: Colors.white),
                      //                       )),
                      //                     )),
                      //                 SizedBox(
                      //                   height: 20,
                      //                 ),
                      //               ],
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //       // SizedBox(
                      //       //   height: 30,
                      //       // ),
                      //       GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(context,
                      //               MaterialPageRoute(builder: (context) => (BottomBar())));
                      //         },
                      //         child: Container(
                      //           height: 40,
                      //           width: 180,
                      //           decoration: BoxDecoration(
                      //             color: Colors.orangeAccent,
                      //             borderRadius: new BorderRadius.circular(10.0),
                      //           ),
                      //           child: Center(
                      //               child: Text(
                      //             "Ok",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontStyle: FontStyle.normal,
                      //                 fontSize: 17,
                      //                 color: Colors.white),
                      //           )),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                    )),
              ));

    // body: Center(
    //   child: Padding(
    //     padding: const EdgeInsets.only(top: 50),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           "Your Interests",
    //           style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(
    //           height: 30,
    //         ),
    //         GestureDetector(
    //             onTap: () => {
    //                   setState(() {
    //                     _hadBeenPressed = !_hadBeenPressed;
    //                     _isBeenPressed = false;
    //                     _wasBeenPressed = false;
    //                     _hasBeenPressed = false;
    //                   })
    //                 },
    //             child: Container(
    //               height: 40,
    //               width: 180,
    //               decoration: BoxDecoration(
    //                   color: _hadBeenPressed
    //                       ? Colors.orangeAccent
    //                       : Colors.cyan,
    //                   borderRadius: BorderRadius.circular(10.0)),
    //               child: Center(
    //                   child: Text(
    //                 "Cricket",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 17,
    //                     color: Colors.white),
    //               )),
    //             )),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         GestureDetector(
    //             onTap: () => {
    //                   setState(() {
    //                     _isBeenPressed = !_isBeenPressed;
    //                     _hadBeenPressed = false;
    //                     _wasBeenPressed = false;
    //                     _hasBeenPressed = false;
    //                   })
    //                 },
    //             child: Container(
    //               height: 40,
    //               width: 180,
    //               decoration: BoxDecoration(
    //                   color: _isBeenPressed
    //                       ? Colors.orangeAccent
    //                       : Colors.cyan,
    //                   borderRadius: BorderRadius.circular(10.0)),
    //               child: Center(
    //                   child: Text(
    //                 "BasketBall",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 17,
    //                     color: Colors.white),
    //               )),
    //             )),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         GestureDetector(
    //             onTap: () => {
    //                   setState(() {
    //                     _wasBeenPressed = !_wasBeenPressed;
    //                     _isBeenPressed = false;
    //                     _hadBeenPressed = false;
    //                     _hasBeenPressed = false;
    //                   })
    //                 },
    //             child: Container(
    //               height: 40,
    //               width: 180,
    //               decoration: BoxDecoration(
    //                   color: _wasBeenPressed
    //                       ? Colors.orangeAccent
    //                       : Colors.cyan,
    //                   borderRadius: BorderRadius.circular(10.0)),
    //               child: Center(
    //                   child: Text(
    //                 "Tennis",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 17,
    //                     color: Colors.white),
    //               )),
    //             )),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         GestureDetector(
    //             onTap: () => {
    //                   setState(() {
    //                     _hasBeenPressed = !_hasBeenPressed;
    //                     _isBeenPressed = false;
    //                     _wasBeenPressed = false;
    //                     _hadBeenPressed = false;
    //                   })
    //                 },
    //             child: Container(
    //               height: 40,
    //               width: 180,
    //               decoration: BoxDecoration(
    //                   color: _hasBeenPressed
    //                       ? Colors.orangeAccent
    //                       : Colors.cyan,
    //                   borderRadius: BorderRadius.circular(10.0)),
    //               child: Center(
    //                   child: Text(
    //                 "FootBall",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 17,
    //                     color: Colors.white),
    //               )),
    //             )),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => (BottomBar())));
    //           },
    //           child: Container(
    //             height: 40,
    //             width: 180,
    //             decoration: BoxDecoration(
    //               color: Colors.orangeAccent,
    //               borderRadius: new BorderRadius.circular(10.0),
    //             ),
    //             child: Center(
    //                 child: Text(
    //               "Ok",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 17,
    //                   color: Colors.white),
    //             )),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
  }

  void getInterestData() async {
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse(
          'http://spotify.bhattihospital.com/api/InterestList',
        ),
        headers: header);
    if (response.statusCode == 200) {
      setState(() {
        var jsonBody = json.decode(response.body);
        for (int i = 0; i < jsonBody['message'].length; i++) {
          interestList.add(InterestModel(
            id: jsonBody['message'][i]['id'].toString(),
            name: jsonBody['message'][i]['name'].toString(),
            created_at: jsonBody['message'][i]['created_at'].toString(),
            updated_at: jsonBody['message'][i]['updated_at'].toString(),
          ));
        }
      });
    }
  }

  void saveInterest(String interestID) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    Map<String, dynamic> data = {"interest_id": interestID};

    var response = await http.post(
        Uri.parse(
          'http://spotify.bhattihospital.com/api/saveInterest',
        ),
        body: jsonEncode(data),
        headers: header);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
