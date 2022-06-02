// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/edit_comment.dart';
import 'package:spotify/login.dart';
import 'package:spotify/models/commentModel.dart';
import 'package:spotify/models/post_model.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/variables/variables.dart';

import 'Chattroom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _hasBeenPressed = false;

  bool _isBeenPressed = false;
  bool _oneBeenPressed = false;

  bool _wasBeenPressed = false;
  bool _hadBeenPressed = false;

  bool _isVisible = false;
  bool like = false;
  var selected = 0;
  List<PostModel> postList = [];
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostData();
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String post_id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff272525),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (interestedsports())));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      body: postList.isEmpty
          ? Center(child: Text("No Posts"))
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(shape: BoxShape.circle
                                    // image: DecorationImage(
                                    //   image:
                                    //       const AssetImage('assets/images/john.jpg'),
                                    //   fit: BoxFit.fill,
                                    // ),
                                    ),
                                child: ClipOval(
                                  child: Image.network(
                                    postList[index].image,
                                    // width: 70.0,
                                    // height: 70.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(postList[index].name,
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
                                            builder: (context) => BottomBar()),
                                      );
                                    } else {
                                      if (result == 1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomBar()),
                                        );
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
                      child: Text(postList[index].description,
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.network(
                        postList[index].postImage,
                        // width: 70.0,
                        // height: 70.0,
                        fit: BoxFit.cover,
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
                                  post_id = postList[index].id;
                                  print("Like id:::::::::::::::::::::::::::" +
                                      post_id);
                                  showlikepost(post_id);
                                  postList[index].like = true;
                                  // PostModel().like = true;
                                  // selected = index;
                                  // _oneBeenPressed = !_oneBeenPressed;
                                })
                              },
                              child: Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: like
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
                          onTap: () => setState(() {
                            post_id = postList[index].id;
                            print("comment id:::::::::::::::::::::::::::" +
                                post_id);
                            showpostcomments(post_id);
                          }),
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
                        GestureDetector(
                          onTap: () {
                            sharePost(postList[index].id);
                          },
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.share),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Share")
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 5,
                    ),
                  ],
                );
              },
            ),

      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 30),
      //     child: Column(
      //       children: [

      //         SizedBox(
      //           height: 10,
      //         ),
      //         Divider(
      //           thickness: 5,
      //         ),
      //         Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 20),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Row(
      //                     children: [
      //                       Image.asset(
      //                         "assets/person1.png",
      //                         height: 60,
      //                         width: 60,
      //                       ),
      //                       Text("Player 2",
      //                           style: TextStyle(
      //                               fontSize: 20,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.bold)),
      //                     ],
      //                   ),
      //                   Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: PopupMenuButton(
      //                           onSelected: (result) {
      //                             if (result == 0) {
      //                               Navigator.push(
      //                                   context,
      //                                   MaterialPageRoute(
      //                                       builder: (context) =>
      //                                           BottomBar()));
      //                             } else {
      //                               if (result == 1) {
      //                                 Navigator.push(
      //                                   context,
      //                                   MaterialPageRoute(
      //                                       builder: (context) =>
      //                                           BottomBar()),
      //                                 );
      //                               }
      //                             }
      //                           },
      //                           offset: Offset(0, 50),
      //                           padding: EdgeInsets.symmetric(
      //                               horizontal: 10, vertical: 20),
      //                           icon: Icon(Icons
      //                               .more_vert), //don't specify icon if you want 3 dot menu
      //                           color: Color.fromARGB(255, 235, 241, 245),
      //                           itemBuilder: (context) => [
      //                                 PopupMenuItem<int>(
      //                                   value: 1,
      //                                   // onTap: (() {
      //                                   //   Navigator.push(
      //                                   //       context,
      //                                   //       MaterialPageRoute(
      //                                   //           builder: (context) =>
      //                                   //               Favourite()));
      //                                   // }),
      //                                   child: Padding(
      //                                     padding:
      //                                         const EdgeInsets.only(left: 10),
      //                                     child: Text("Delete"),
      //                                   ),
      //                                 ),
      //                                 // PopupMenuItem<int>(
      //                                 //   value: 1,
      //                                 //   child: Padding(
      //                                 //     padding:
      //                                 //         const EdgeInsets.only(left: 10),
      //                                 //     child: Text("Share"),
      //                                 //   ),
      //                                 // ),
      //                               ]))
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               width: 320,
      //               child: Text(
      //                   "Hello Hope you are doing well. Stay in touch for further updates",
      //                   textAlign: TextAlign.justify),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(16.0),
      //               child: Image.asset(
      //                 "assets/house.jpg",
      //                 // height: 60,
      //                 // width: 60,
      //               ),
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 Row(
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () => {
      //                         setState(() {
      //                           _isBeenPressed = !_isBeenPressed;
      //                           // _oneBeenPressed = false;
      //                           // _hasBeenPressed = false;
      //                           // _hadBeenPressed = false;
      //                         })
      //                       },
      //                       child: Icon(
      //                         FontAwesomeIcons.thumbsUp,
      //                         color: _isBeenPressed
      //                             ? Theme.of(context).primaryColor
      //                             : Colors.black,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 5.0,
      //                     ),
      //                     Text("Like")
      //                   ],
      //                 ),
      //                 GestureDetector(
      //                   onTap: () => _playlistModalBottomSheet(context),
      //                   child: Row(
      //                     children: [
      //                       Icon(FontAwesomeIcons.comment),
      //                       SizedBox(
      //                         width: 5.0,
      //                       ),
      //                       Text("Comment")
      //                     ],
      //                   ),
      //                 ),
      //                 Row(
      //                   children: [
      //                     Icon(FontAwesomeIcons.share),
      //                     SizedBox(
      //                       width: 5.0,
      //                     ),
      //                     Text("Share")
      //                   ],
      //                 )
      //               ],
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             // Visibility(
      //             //   visible: _isVisible,
      //             //   child: SizedBox(
      //             //       width: 330,
      //             //       height: 45,
      //             //       child: TextFormField(
      //             //         style: TextStyle(height: 1.5),
      //             //         decoration: InputDecoration(
      //             //             border: OutlineInputBorder(
      //             //                 borderSide: BorderSide(
      //             //                     color: Colors.black, width: 2.0),
      //             //                 borderRadius: BorderRadius.circular(8.0)),
      //             //             hintText: "Comment",
      //             //             filled: true,
      //             //             contentPadding: EdgeInsets.symmetric(
      //             //                 vertical: 10, horizontal: 10)),
      //             //         keyboardType: TextInputType.emailAddress,
      //             //       )),
      //             // ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // )
    );
  }

  _playlistModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 600,
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: commentList.length,
                            itemBuilder: (context, index) {
                              return Padding(
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
                                              height: 150,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        deleteComment(
                                                            commentList[index]
                                                                .id);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .delete_forever_outlined),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text("Delete",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          (EditComment(
                                                                            comment_id:
                                                                                commentList[index].id,
                                                                          )))),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.edit),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text("Edit",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
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
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15)),
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
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                commentList[index].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                commentList[index].comment,
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 330,
                            height: 45,
                            child: TextFormField(
                              controller: nameController,
                              validator: (comment) =>
                                  comment!.isEmpty ? 'Required' : null,
                              style: TextStyle(height: 1.5),
                              decoration: InputDecoration(
                                  // suffixIcon: Icon(
                                  //   FontAwesomeIcons.paperPlane,
                                  //   color: Colors.black,
                                  // ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  hintText: "Write a comment...",
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)),
                              keyboardType: TextInputType.emailAddress,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // String comment = nameController.text;
                            // String email = emailController.text;
                            //nameController.clear();
                            registerUser(post_id, nameController.text);
                          }
                          print(nameController.text);
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "Comment",
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
                ));
          });
        });
  }

  void getPostData() async {
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse(
          'http://spotify.bhattihospital.com/api/homePost',
        ),
        headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      for (int i = 0; i < jsonBody['message'].length; i++) {
        postList.add(PostModel(
            id: jsonBody['message'][i]['id'].toString(),
            userID: jsonBody['message'][i]['user_id'].toString(),
            postImage: jsonBody['message'][i]['postImage'].toString(),
            description: jsonBody['message'][i]['description'].toString(),
            date: jsonBody['message'][i]['date'].toString(),
            time: jsonBody['message'][i]['time'].toString(),
            name: jsonBody['message'][i]['name'].toString(),
            image: jsonBody['message'][i]['image'].toString()));
      }
      setState(() {});
    }
  }

  registerUser(String post_id, String comment) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> commentMap = {
      "post_id": post_id,
      "comment": comment,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/postComment');

    var response =
        await http.post(url, body: jsonEncode(commentMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['message'] == 'Comment posted') {
        /// navigate to login screen
        print('MESSAGE:::::::' + responseBody['message']);
        nameController.clear();
        Navigator.of(context).pop();
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  showpostcomments(String post_id) async {
    if (commentList.isNotEmpty) {
      commentList.clear();
    }

    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    // Map<String, dynamic> commentMap = {
    //   "post_id": post_id,
    // };

    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/showPostComment/' + post_id);

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen

        setState(() {
          for (int i = 0; i < responseBody['message'].length; i++) {
            commentList.add(CommentModel(
              id: responseBody['message'][i]['id'].toString(),
              user_id: responseBody['message'][i]['user_id'].toString(),
              comment: responseBody['message'][i]['comment'].toString(),
              date: responseBody['message'][i]['date'].toString(),
              time: responseBody['message'][i]['time'].toString(),
              name: responseBody['message'][i]['name'].toString(),
              image: responseBody['message'][i]['image'].toString(),
            ));
          }
        });
        _playlistModalBottomSheet(context);
        // print('MESSAGE:::::::' + responseBody['message']);
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  showlikepost(String post_id) async {
    // if (commentList.isNotEmpty) {
    //   commentList.clear();
    // }

    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    // Map<String, dynamic> commentMap = {
    //   "post_id": post_id,
    // };

    var url =
        Uri.parse('http://spotify.bhattihospital.com/api/postLike/' + post_id);

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
        print('Like Posted:::');
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Post Liked"),
        ));
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
        //           child: Text("like Deleted",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(color: Colors.black, fontSize: 15)),
        //         ),
        //       ),
        //     );
        //   },
        // );
        // // print('MESSAGE:::::::' + responseBody['message']);

      } else {}
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  void sharePost(String postID) async {
    var url =
        Uri.parse('http://spotify.bhattihospital.com/api/SharePost/' + postID);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print(response.body);
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text("Post Shared Successfuly"),
      ));
    }
  }

  void deleteComment(String commentID) async {
    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/deleteComment/' + commentID);

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

  // void showLongToast() {
  //   Fluttertoast.showToast(
  //     msg: "This is Long Toast",
  //     toastLength: Toast.LENGTH_LONG,
  //   );
  // }

  // void showColoredToast() {
  //   Fluttertoast.showToast(
  //       msg: "This is Colored Toast",
  //       toastLength: Toast.LENGTH_SHORT,
  //       bgcolor: "#009968",
  //       textcolor: '#ffffff'
  //   );
  // }

  // void showShortToast() {
  //   Fluttertoast.showToast(
  //       msg: "This is Short Toast",
  //       toastLength: Toast.LENGTH_SHORT,
  //       timeInSecForIos: 1
  //   );
  // }
  // void showTopShortToast() {
  //   Fluttertoast.showToast(
  //       msg: "This is Top Short Toast",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIos: 1
  //   );
  // }
  void showCenterShortToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
