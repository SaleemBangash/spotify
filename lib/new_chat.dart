// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/variables/variables.dart';
import 'package:http/http.dart' as http;

import 'models/chat_model.dart';

class NewcChat extends StatefulWidget {
  const NewcChat({Key? key}) : super(key: key);

  @override
  State<NewcChat> createState() => _NewcChatState();
}

class _NewcChatState extends State<NewcChat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getchatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff272525),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (BottomBar())));
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          "Chat",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: chatList.isEmpty
          ? Center(child: Text("No Chat"))
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(chatList[index].reciever_id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (chatt(
                                            receiver_id:
                                                chatList[index].reciever_id,
                                          ))));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onLongPress: () => showDialog(
                                      barrierDismissible: true,
                                      // barrierColor: Theme.of(context).primaryColor,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0)), //this right here,
                                          backgroundColor: Colors.white,
                                          content: Container(
                                            height: 100,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      deleteAllChat(
                                                          chatList[index]
                                                              .reciever_id);
                                                      // Navigator.of(context)
                                                      //     .pop();
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .delete_forever_outlined),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text("Delete",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.close),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text("Cancel",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle
                                              // image: DecorationImage(
                                              //   image:
                                              //       const AssetImage('assets/images/john.jpg'),
                                              //   fit: BoxFit.fill,
                                              // ),
                                              ),
                                          child: ClipOval(
                                            child: Image.network(
                                              chatList[0].image,
                                              // width: 70.0,
                                              // height: 70.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        // Image.asset(
                                        //   "assets/person.png",
                                        //   width: 80,
                                        //   height: 80,
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              chatList[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            // Text(
                                            //   "Hi How Are You",
                                            //   style: TextStyle(fontSize: 13),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text("Today",
                                  //     style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Divider(thickness: 1, color: Colors.black),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
              ],
            ),

      // body: Container(
      //   child: Column(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           // Navigator.push(context,
      //           //     MaterialPageRoute(builder: (context) => (chatt())));
      //         },
      //         child: Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Row(
      //                 children: [
      //                   Image.asset(
      //                     "assets/person.png",
      //                     width: 80,
      //                     height: 80,
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         "John Smith",
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 18),
      //                       ),
      //                       Text(
      //                         "Hi How Are You",
      //                         style: TextStyle(fontSize: 13),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //               Text("Today", style: TextStyle(color: Colors.black)),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 20,
      //         ),
      //         child: Divider(thickness: 1, color: Colors.black),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           // Navigator.push(context,
      //           //     MaterialPageRoute(builder: (context) => (chatt())));
      //         },
      //         child: Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 10),
      //                 child: Row(
      //                   children: [
      //                     ClipRRect(
      //                       borderRadius: BorderRadius.circular(50.0),
      //                       child: Image.asset(
      //                         "assets/download1.jpg",
      //                         fit: BoxFit.cover,
      //                         width: 50,
      //                         height: 50,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 30,
      //                     ),
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           "Ryan Smith",
      //                           style: TextStyle(
      //                               fontWeight: FontWeight.bold, fontSize: 18),
      //                         ),
      //                         Text(
      //                           "How are you feeling",
      //                           style: TextStyle(fontSize: 13),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               Text("Yesterday", style: TextStyle(color: Colors.black)),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 20,
      //         ),
      //         child: Divider(thickness: 1, color: Colors.black),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(left: 10),
      //               child: Row(
      //                 children: [
      //                   ClipRRect(
      //                     borderRadius: BorderRadius.circular(50.0),
      //                     child: Image.asset(
      //                       "assets/buildingg.jpg",
      //                       fit: BoxFit.cover,
      //                       width: 50,
      //                       height: 50,
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 30,
      //                   ),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         "Robin Ben",
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 18),
      //                       ),
      //                       Text(
      //                         "And What about you",
      //                         style: TextStyle(fontSize: 13),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Text("Today", style: TextStyle(color: Colors.black)),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 20,
      //         ),
      //         child: Divider(thickness: 1, color: Colors.black),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Row(
      //               children: [
      //                 Image.asset(
      //                   "assets/person1.png",
      //                   width: 80,
      //                   height: 80,
      //                 ),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Ben Marks",
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold, fontSize: 18),
      //                     ),
      //                     Text(
      //                       "What ar you doing",
      //                       style: TextStyle(fontSize: 13),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             Text("Yesterday", style: TextStyle(color: Colors.black)),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 20,
      //         ),
      //         child: Divider(thickness: 1, color: Colors.black),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void getchatData() async {
    if (chatList.isNotEmpty) {
      chatList.clear();
    }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse(
          'http://spotify.bhattihospital.com/api/messageUserList',
        ),
        headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      print(":::;;;::::;:::::::");
      print(jsonBody["users"][0]["reciever_id"]);
      print(":::;;;::::;:::::::");
      setState(() {
        for (int i = 0; i < jsonBody['users'].length; i++) {
          chatList.add(ChatModel(
              send_id: jsonBody['users'][i]['send_id'].toString(),
              reciever_id: jsonBody['users'][i]['reciever_id'].toString(),
              status: jsonBody['users'][i]['status'].toString(),
              name: jsonBody['users'][i]['name'].toString(),
              image: jsonBody['users'][i]['image'].toString()));
        }
      });
    }
  }

  void deleteAllChat(String receiverID) async {
    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/deleteCompleteChat/' +
            receiverID);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print("RESPONSE:::::::::::::::" + response.body);
      // showDialog(
      //   barrierDismissible: true,
      //   // barrierColor: Theme.of(context).primaryColor,
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15.0)), //this right here,
      //       backgroundColor: Colors.white,
      //       content: Container(
      //         height: 50,
      //         child: Center(
      //           child: Text("Comment Deleted",
      //               textAlign: TextAlign.center,
      //               style: TextStyle(color: Colors.black, fontSize: 15)),
      //         ),
      //       ),
      //     );
      //   },
      // );

      Navigator.of(context).pop();
    }
  }
}
