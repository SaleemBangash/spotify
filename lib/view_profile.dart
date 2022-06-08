// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, dead_code

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/bottom_bar.dart';

import 'package:spotify/calendar.dart';
import 'package:spotify/models/view_profile_post_model.dart';

import 'package:spotify/sportsinterest.dart';
import 'package:spotify/variables/variables.dart';
import 'package:http/http.dart' as http;

import 'models/commentModel.dart';
import 'models/edit_my_comment.dart';

import 'models/post_model.dart';

import 'models/user_post_model.dart';
import 'models/view_profile_model.dart';

class ViewProfile extends StatefulWidget {
  String userSearch_id;
  ViewProfile({Key? key, required this.userSearch_id}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController newcontroller = TextEditingController();
  TextEditingController oldcontroller = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String post_id = '';
  String userSearch_id = '';
  List<ViewProfilePostModel> ViewOtherProfileList = [];

  bool isEditable = false;
  bool _oneBeenPressed = false;
  List<PostModel> postList = [];
  bool like = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData(widget.userSearch_id);
  }

  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff272525),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomBar()));
            }
            //onPressed: () => Navigator.of(context).pop(),
            ),
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calendar()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: viewprofileList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle
                          // image: DecorationImage(
                          //   image:
                          //       const AssetImage('assets/images/john.jpg'),
                          //   fit: BoxFit.fill,
                          // ),
                          ),
                      child: ClipOval(
                        child: Image.network(
                          viewprofileList[0].profileImage,
                          // width: 70.0,
                          // height: 70.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      viewprofileList[0].name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          // IconButton(
                          //     icon: Icon(Icons.edit),
                          //     onPressed: () {
                          //       Navigator.of(context).push(MaterialPageRoute(
                          //           builder: (context) => profile()));
                          //       // setState(() {
                          //       //   _isEnable = true;
                          //       // });
                          //     })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewprofileList[0].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          // IconButton(
                          //     icon: Icon(Icons.edit),
                          //     onPressed: () {
                          //       setState(() {
                          //         _isEnable = true;
                          //       });
                          //     })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewprofileList[0].email,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bio",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          // IconButton(
                          //     icon: Icon(Icons.edit),
                          //     onPressed: () {
                          //       setState(() {
                          //         _isEnable = true;
                          //       });
                          //     })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewprofileList[0].bio,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Expanded(
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       itemCount: viewprofileList.length,
                //       itemBuilder: (context, index) {
                //         return

                //       }),
                // ),
                SizedBox(
                  height: 10,
                ),
                ViewOtherProfileList.isEmpty
                    ? Center(child: Text("No Posts"))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: ViewOtherProfileList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                ViewOtherProfileList[index]
                                                    .image,
                                                // width: 70.0,
                                                // height: 70.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(ViewOtherProfileList[index].name,
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
                                                  Navigator.of(context).pop();
                                                } else {
                                                  if (result == 1) {
                                                    print(ViewOtherProfileList[
                                                            index]
                                                        .id);
                                                    deletePost(
                                                        ViewOtherProfileList[
                                                                index]
                                                            .id);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                BottomBar())));
                                                  }
                                                }
                                              },
                                              offset: Offset(0, 50),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 20),
                                              icon: Icon(Icons
                                                  .more_vert), //don't specify icon if you want 3 dot menu
                                              color: Color.fromARGB(
                                                  255, 235, 241, 245),
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
                                                            const EdgeInsets
                                                                .only(left: 10),
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
                                      ViewOtherProfileList[index].description,
                                      textAlign: TextAlign.justify),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.network(
                                    ViewOtherProfileList[index].postImage,
                                    // width: 70.0,
                                    // height: 70.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => {
                                            setState(() {
                                              post_id =
                                                  ViewOtherProfileList[index]
                                                      .id;
                                              print(
                                                  "Like id:::::::::::::::::::::::::::" +
                                                      post_id);
                                              showlikepost(post_id);
                                              ViewOtherProfileList[index].like =
                                                  true;
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
                                        Text("Like"),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                            ViewOtherProfileList[index]
                                                .comments,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        post_id =
                                            ViewOtherProfileList[index].id;
                                        print(
                                            "comment id:::::::::::::::::::::::::::" +
                                                post_id);
                                        showpostcomments(post_id);
                                      }),
                                      child: Row(
                                        children: [
                                          Icon(FontAwesomeIcons.comment),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text("Comment"),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                              ViewOtherProfileList[index]
                                                  .comments,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            sharePost(
                                                ViewOtherProfileList[index].id);
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
                      ),
              ],
            ),
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
                                                                          (EditMyComment(
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

  void getProfileData(String userSearchId) async {
    if (viewprofileList.isNotEmpty) {
      viewprofileList.clear();
    }
    if (ViewOtherProfileList.isNotEmpty) {
      ViewOtherProfileList.clear();
    }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/UserProfile/' + userSearchId);

    var response = await http.get(url, headers: header);
    // var response = await http.get(
    //     Uri.parse(
    //       'http://spotify.bhattihospital.com/api/UserProfile/'+String userSearchId
    //     ),
    //     headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      print(jsonBody);
      viewprofileList.add(ViewProfileModel(
        name: jsonBody['profile']['name'].toString(),
        profileImage: jsonBody['profile']['profileImage'].toString(),
        email: jsonBody['profile']['email'].toString(),
        bio: jsonBody['profile']['bio'].toString(),
      ));
      for (int i = 0; i < jsonBody['profile']['post'].length; i++) {
        ViewOtherProfileList.add(ViewProfilePostModel(
            id: jsonBody['profile']['post'][i]['id'].toString(),
            userID: jsonBody['profile']['post'][i]['user_id'].toString(),
            postImage: jsonBody['profile']['post'][i]['postImage'].toString(),
            description:
                jsonBody['profile']['post'][i]['description'].toString(),
            date: jsonBody['profile']['post'][i]['date'].toString(),
            time: jsonBody['profile']['post'][i]['time'].toString(),
            likes: jsonBody['profile']['post'][i]['likes'].toString(),
            comments: jsonBody['profile']['post'][i]['comments'].toString(),
            name: jsonBody['profile']['post'][i]['name'].toString(),
            image: jsonBody['profile']['post'][i]['image'].toString()));
      }
      setState(() {});
    }
  }

  void deletePost(String postID) async {
    var url =
        Uri.parse('http://spotify.bhattihospital.com/api/deletePost/' + postID);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print("RESPONSE:::::::::::::::" + response.body);
      var responseBody = json.decode(response.body);

      if (responseBody['success']) {
        /// navigate to login screen
        print('Like Posted:::');
        // _scaffoldKey.currentState!.showSnackBar(SnackBar(
        //   content: Text("Post Deleted"),
        // ));

      }
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
}
