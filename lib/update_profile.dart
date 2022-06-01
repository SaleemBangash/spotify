// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, dead_code

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/calendar.dart';
import 'package:spotify/profile.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:spotify/variables/variables.dart';
import 'package:http/http.dart' as http;

import 'Community.dart';
import 'Editing_the_post.dart';
import 'models/my_post_model.dart';
import 'models/post_model.dart';
import 'models/profile_model.dart';
import 'models/user_post_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController newcontroller = TextEditingController();
  TextEditingController oldcontroller = TextEditingController();
  TextEditingController Pcontroller = TextEditingController();
  bool _isEnable = false;
  bool _atEnable = false;
  bool _onEnable = false;

  String Ftitle = "Azan Malik";
  String title = "Ali";
  String Ctitle = "********";
  String Ptitle = "********";
  bool isEditable = false;
  bool _oneBeenPressed = false;
  List<PostModel> postList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                  MaterialPageRoute(builder: (context) => interestedsports()));
            }
            //onPressed: () => Navigator.of(context).pop(),
            ),
        title: Text(
          'Profile',
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
      body: profileList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: profileList.length,
                      itemBuilder: (context, index) {
                        return Column(
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
                                  profileList[index].image,
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
                              profileList[index].name,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Personal Information",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    profile()));
                                      })
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  profileList[index].name,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  profileList[index].email,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  profileList[index].bio,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                userspostList.isEmpty
                    ? Center(child: Text("No Posts"))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: userspostList.length,
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
                                          // Image.network(postList[index].image),
                                          Text(userspostList[index].name,
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
                                                        builder: (context) =>
                                                            BottomBar()),
                                                  );
                                                } else {
                                                  if (result == 1) {
                                                    print(userspostList[index]
                                                        .id);
                                                    deletePost(
                                                        userspostList[index]
                                                            .id);
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
                                  child: Text(userspostList[index].description,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => {
                                            setState(() {
                                              _oneBeenPressed =
                                                  !_oneBeenPressed;
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
                                      onTap: () =>
                                          _playlistModalBottomSheet(context),
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

    //   body: SingleChildScrollView(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           // Image.asset(
    //           //   'assets/person_2.png',
    //           //   width: 70.0,
    //           //   height: 70.0,
    //           //   fit: BoxFit.cover,
    //           // ),
    //           Image.asset(
    //             'assets/person.png',
    //             width: 70.0,
    //             height: 70.0,
    //             fit: BoxFit.cover,
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),

    //           Text(
    //             'Naveed Khan',
    //             style:
    //                 TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //           ),
    //           // GestureDetector(
    //           //   onTap: () => _showChoiceDialog(context),
    //           //   child: ClipRRect(
    //           //     borderRadius: BorderRadius.circular(35.0),
    //           //     child: Container(
    //           //       decoration: BoxDecoration(
    //           //         borderRadius: BorderRadius.circular(20.0),
    //           //         // shape: BoxShape.circle,
    //           //       ),
    //           //       width: 70.0,
    //           //       height: 70.0,
    //           //       // color: Colors.green,
    //           //       child: (imageFile == null)
    //           //           ? Image.asset(
    //           //               'assets/person.png',
    //           //               width: 70.0,
    //           //               height: 70.0,
    //           //               fit: BoxFit.cover,
    //           //             )
    //           //           // Text("Choose Image")
    //           //           : Image.file(
    //           //               File(imageFile!.path),
    //           //               // width: 290,
    //           //               // height: 120,
    //           //               fit: BoxFit.cover,
    //           //             ),
    //           //     ),
    //           //   ),
    //           // ),

    //           SizedBox(
    //             height: 10,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 20),
    //             child: Center(
    //               child: Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           "FirstName",
    //                           style: TextStyle(
    //                               color: Colors.black,
    //                               fontSize: 17,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         IconButton(
    //                             icon: Icon(Icons.edit),
    //                             onPressed: () {
    //                               setState(() {
    //                                 _isEnable = true;
    //                               });
    //                             })
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: SizedBox(
    //                       width: 300,
    //                       child: Expanded(
    //                           child: !_isEnable
    //                               ? Text(title)
    //                               : TextFormField(
    //                                   initialValue: title,
    //                                   textInputAction: TextInputAction.done,
    //                                   onFieldSubmitted: (value) {
    //                                     setState(() => {
    //                                           isEditable = false,
    //                                           title = value
    //                                         });
    //                                   })),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           "LastName",
    //                           style: TextStyle(
    //                               color: Colors.black,
    //                               fontSize: 17,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         IconButton(
    //                             icon: Icon(Icons.edit),
    //                             onPressed: () {
    //                               setState(() {
    //                                 isEditable = true;
    //                               });
    //                             })
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: SizedBox(
    //                       width: 300,
    //                       child: Expanded(
    //                           child: !isEditable
    //                               ? Text(Ftitle)
    //                               : TextFormField(
    //                                   initialValue: Ftitle,
    //                                   textInputAction: TextInputAction.done,
    //                                   onFieldSubmitted: (value) {
    //                                     setState(() => {
    //                                           isEditable = false,
    //                                           Ftitle = value
    //                                         });
    //                                   })),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           "Password",
    //                           style: TextStyle(
    //                               color: Colors.black,
    //                               fontSize: 17,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         IconButton(
    //                             icon: Icon(Icons.edit),
    //                             onPressed: () {
    //                               setState(() {
    //                                 _onEnable = true;
    //                               });
    //                             })
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 40),
    //                     child: SizedBox(
    //                       width: 300,
    //                       child: Expanded(
    //                           child: !_onEnable
    //                               ? Text(Ptitle)
    //                               : TextFormField(
    //                                   obscureText: true,
    //                                   keyboardType:
    //                                       TextInputType.visiblePassword,
    //                                   initialValue: Ptitle,
    //                                   textInputAction: TextInputAction.done,
    //                                   onFieldSubmitted: (value) {
    //                                     setState(() => {
    //                                           _onEnable = false,
    //                                           Ptitle = value
    //                                         });
    //                                   })),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   SizedBox(
    //                       width: 290,
    //                       height: 45,
    //                       child: TextFormField(
    //                         style: TextStyle(height: 1.5),
    //                         decoration: InputDecoration(
    //                             border: OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                     color: Colors.black, width: 2.0),
    //                                 borderRadius: BorderRadius.circular(15)),
    //                             hintText: "Bio",
    //                             filled: true,
    //                             contentPadding: EdgeInsets.symmetric(
    //                                 vertical: 10, horizontal: 10)),
    //                         obscureText: true,
    //                         keyboardType: TextInputType.text,
    //                       )),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => (BottomBar())));
    //                     },
    //                     child: Container(
    //                       height: 40,
    //                       width: 140,
    //                       decoration: BoxDecoration(
    //                         color: Colors.cyan,
    //                         borderRadius: new BorderRadius.circular(10.0),
    //                       ),
    //                       child: Center(
    //                           child: Text(
    //                         "Update",
    //                         style: TextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                             fontStyle: FontStyle.normal,
    //                             color: Colors.white),
    //                       )),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => Community()));
    //                     },
    //                     child: Text(
    //                       "Create Community",
    //                       style: TextStyle(
    //                           fontSize: 17.0,
    //                           fontStyle: FontStyle.normal,
    //                           color: Colors.black),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 Image.asset(
    //                                   "assets/person.png",
    //                                   height: 60,
    //                                   width: 60,
    //                                 ),
    //                                 Text("Player 1",
    //                                     style: TextStyle(
    //                                         fontSize: 20,
    //                                         color: Colors.black,
    //                                         fontWeight: FontWeight.bold)),
    //                               ],
    //                             ),
    //                             Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: PopupMenuButton(
    //                                     onSelected: (result) {
    //                                       if (result == 0) {
    //                                         Navigator.push(
    //                                           context,
    //                                           MaterialPageRoute(
    //                                               builder: (context) =>
    //                                                   Editing()),
    //                                         );
    //                                       } else {
    //                                         if (result == 1) {
    //                                           // Navigator.push(
    //                                           //   context,
    //                                           //   MaterialPageRoute(
    //                                           //       builder: (context) =>
    //                                           //           BottomBar()),
    //                                           // );
    //                                         }
    //                                       }
    //                                     },
    //                                     offset: Offset(0, 50),
    //                                     padding: EdgeInsets.symmetric(
    //                                         horizontal: 10, vertical: 20),
    //                                     icon: Icon(Icons
    //                                         .more_vert), //don't specify icon if you want 3 dot menu
    //                                     color:
    //                                         Color.fromARGB(255, 235, 241, 245),
    //                                     itemBuilder: (context) => [
    //                                           PopupMenuItem<int>(
    //                                             value: 0,
    //                                             // onTap: (() {
    //                                             //   Navigator.push(
    //                                             //       context,
    //                                             //       MaterialPageRoute(
    //                                             //           builder: (context) =>
    //                                             //               Profile()));
    //                                             // }),
    //                                             child: Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(
    //                                                       left: 10),
    //                                               child: Text(
    //                                                 "Edit",
    //                                                 style: TextStyle(
    //                                                     color: Color.fromARGB(
    //                                                         255, 0, 0, 0)),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                           PopupMenuItem<int>(
    //                                             value: 1,
    //                                             // onTap: (() {
    //                                             //   Navigator.push(
    //                                             //       context,
    //                                             //       MaterialPageRoute(
    //                                             //           builder: (context) =>
    //                                             //               Favourite()));
    //                                             // }),
    //                                             child: Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(
    //                                                       left: 10),
    //                                               child: Text("Delete"),
    //                                             ),
    //                                           ),
    //                                           // PopupMenuItem<int>(
    //                                           //   value: 1,
    //                                           //   child: Padding(
    //                                           //     padding:
    //                                           //         const EdgeInsets.only(
    //                                           //             left: 10),
    //                                           //     child: Text("Share"),
    //                                           //   ),
    //                                           // ),
    //                                         ]))
    //                           ],
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 320,
    //                         child: Text("Good Will send you some suggestions. ",
    //                             textAlign: TextAlign.justify),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(16.0),
    //                         child: Image.asset(
    //                           "assets/house.jpg",
    //                           // height: 60,
    //                           // width: 60,
    //                         ),
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Icon(FontAwesomeIcons.thumbsUp),
    //                               SizedBox(
    //                                 width: 5.0,
    //                               ),
    //                               Text("Like")
    //                             ],
    //                           ),
    //                           GestureDetector(
    //                             onTap: () => _playlistModalBottomSheet(context),
    //                             child: Row(
    //                               children: [
    //                                 Icon(FontAwesomeIcons.comment),
    //                                 SizedBox(
    //                                   width: 5.0,
    //                                 ),
    //                                 Text("Comment")
    //                               ],
    //                             ),
    //                           ),
    //                           Row(
    //                             children: [
    //                               Icon(FontAwesomeIcons.share),
    //                               SizedBox(
    //                                 width: 5.0,
    //                               ),
    //                               Text("Share")
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       Visibility(
    //                         visible: _isVisible,
    //                         child: SizedBox(
    //                             width: 330,
    //                             height: 45,
    //                             child: TextFormField(
    //                               style: TextStyle(height: 1.5),
    //                               decoration: InputDecoration(
    //                                   border: OutlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.black, width: 2.0),
    //                                       borderRadius:
    //                                           BorderRadius.circular(8.0)),
    //                                   hintText: "Comment",
    //                                   filled: true,
    //                                   contentPadding: EdgeInsets.symmetric(
    //                                       vertical: 10, horizontal: 10)),
    //                               keyboardType: TextInputType.emailAddress,
    //                             )),
    //                       )
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Divider(
    //                     thickness: 5,
    //                   ),
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 Image.asset(
    //                                   "assets/person1.png",
    //                                   height: 60,
    //                                   width: 60,
    //                                 ),
    //                                 Text("Player 2",
    //                                     style: TextStyle(
    //                                         fontSize: 20,
    //                                         color: Colors.black,
    //                                         fontWeight: FontWeight.bold)),
    //                               ],
    //                             ),
    //                             Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: PopupMenuButton(
    //                                     onSelected: (result) {
    //                                       if (result == 0) {
    //                                         Navigator.push(
    //                                           context,
    //                                           MaterialPageRoute(
    //                                               builder: (context) =>
    //                                                   Editing()),
    //                                         );
    //                                       } else {
    //                                         if (result == 1) {
    //                                           // Navigator.push(
    //                                           //   context,
    //                                           //   MaterialPageRoute(
    //                                           //       builder: (context) =>
    //                                           //           UpdateProfile()),
    //                                           // );
    //                                         }
    //                                       }
    //                                     },
    //                                     offset: Offset(0, 50),
    //                                     padding: EdgeInsets.symmetric(
    //                                         horizontal: 10, vertical: 20),
    //                                     icon: Icon(Icons
    //                                         .more_vert), //don't specify icon if you want 3 dot menu
    //                                     color:
    //                                         Color.fromARGB(255, 235, 241, 245),
    //                                     itemBuilder: (context) => [
    //                                           PopupMenuItem<int>(
    //                                             value: 0,
    //                                             // onTap: (() {
    //                                             //   Navigator.push(
    //                                             //       context,
    //                                             //       MaterialPageRoute(
    //                                             //           builder: (context) =>
    //                                             //               Profile()));
    //                                             // }),
    //                                             child: Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(
    //                                                       left: 10),
    //                                               child: Text(
    //                                                 "Edit",
    //                                                 style: TextStyle(
    //                                                     color: Color.fromARGB(
    //                                                         255, 0, 0, 0)),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                           PopupMenuItem<int>(
    //                                             value: 1,
    //                                             // onTap: (() {
    //                                             //   Navigator.push(
    //                                             //       context,
    //                                             //       MaterialPageRoute(
    //                                             //           builder: (context) =>
    //                                             //               Favourite()));
    //                                             // }),
    //                                             child: Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(
    //                                                       left: 10),
    //                                               child: Text("Delete"),
    //                                             ),
    //                                           ),
    //                                           // PopupMenuItem<int>(
    //                                           //   value: 1,
    //                                           //   child: Padding(
    //                                           //     padding:
    //                                           //         const EdgeInsets.only(
    //                                           //             left: 10),
    //                                           //     child: Text("Share"),
    //                                           //   ),
    //                                           // ),
    //                                         ]))
    //                           ],
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 320,
    //                         child: Text(
    //                             "Hello Hope you are doing well. Stay in touch for further updates",
    //                             textAlign: TextAlign.justify),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(16.0),
    //                         child: Image.asset(
    //                           "assets/house.jpg",
    //                           // height: 60,
    //                           // width: 60,
    //                         ),
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Icon(FontAwesomeIcons.thumbsUp),
    //                               SizedBox(
    //                                 width: 5.0,
    //                               ),
    //                               Text("Like")
    //                             ],
    //                           ),
    //                           GestureDetector(
    //                             onTap: () => _playlistModalBottomSheet(context),
    //                             child: Row(
    //                               children: [
    //                                 Icon(FontAwesomeIcons.comment),
    //                                 SizedBox(
    //                                   width: 5.0,
    //                                 ),
    //                                 Text("Comment")
    //                               ],
    //                             ),
    //                           ),
    //                           Row(
    //                             children: [
    //                               Icon(FontAwesomeIcons.share),
    //                               SizedBox(
    //                                 width: 5.0,
    //                               ),
    //                               Text("Share")
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       // Visibility(
    //                       //   visible: _isVisible,
    //                       //   child: SizedBox(
    //                       //       width: 330,
    //                       //       height: 45,
    //                       //       child: TextFormField(
    //                       //         style: TextStyle(height: 1.5),
    //                       //         decoration: InputDecoration(
    //                       //             border: OutlineInputBorder(
    //                       //                 borderSide: BorderSide(
    //                       //                     color: Colors.black, width: 2.0),
    //                       //                 borderRadius:
    //                       //                     BorderRadius.circular(8.0)),
    //                       //             hintText: "Comment",
    //                       //             filled: true,
    //                       //             contentPadding: EdgeInsets.symmetric(
    //                       //                 vertical: 10, horizontal: 10)),
    //                       //         keyboardType: TextInputType.emailAddress,
    //                       //       )),
    //                       // )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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

  void getProfileData() async {
    if (profileList.isNotEmpty) {
      profileList.clear();
    }
    if (userspostList.isNotEmpty) {
      userspostList.clear();
    }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse(
          'http://spotify.bhattihospital.com/api/showProfile',
        ),
        headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);

      setState(() {
        profileList.add(ProfileModel(
          tokan: jsonBody['profile']['tokan'].toString(),
          id: jsonBody['profile']['id'].toString(),
          name: jsonBody['profile']['name'].toString(),
          username: jsonBody['profile']['username'].toString(),
          email: jsonBody['profile']['email'].toString(),
          image: jsonBody['profile']['image'].toString(),
          bio: jsonBody['profile']['bio'].toString(),
        ));
        for (int i = 0; i < jsonBody['profile']['posts'].length; i++) {
          userspostList.add(UserPostModel(
              id: jsonBody['profile']['posts'][i]['id'].toString(),
              userID: jsonBody['profile']['posts'][i]['user_id'].toString(),
              postImage:
                  jsonBody['profile']['posts'][i]['postImage'].toString(),
              description:
                  jsonBody['profile']['posts'][i]['description'].toString(),
              date: jsonBody['profile']['posts'][i]['date'].toString(),
              time: jsonBody['profile']['posts'][i]['time'].toString(),
              name: jsonBody['profile']['posts'][i]['name'].toString(),
              image: jsonBody['profile']['posts'][i]['image'].toString()));
        }
      });
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

      }
    }

    // PickedFile? imageFile = null;

    // // Future<void> _showChoiceDialog(BuildContext context) async {
    // Future<void> _showChoiceDialog(BuildContext context) {
    //   return showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text(
    //             "Choose option",
    //             style: TextStyle(color: Colors.blue),
    //           ),
    //           content: SingleChildScrollView(
    //             child: ListBody(
    //               children: [
    //                 Divider(
    //                   height: 1,
    //                   color: Colors.blue,
    //                 ),
    //                 ListTile(
    //                   onTap: () {
    //                     _openGallery(context);
    //                   },
    //                   title: Text("Gallery"),
    //                   leading: Icon(
    //                     Icons.account_box,
    //                     color: Colors.blue,
    //                   ),
    //                 ),
    //                 Divider(
    //                   height: 1,
    //                   color: Colors.blue,
    //                 ),
    //                 ListTile(
    //                   onTap: () {
    //                     _openCamera(context);
    //                   },
    //                   title: Text("Camera"),
    //                   leading: Icon(
    //                     Icons.camera,
    //                     color: Colors.blue,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }

    // void _openGallery(BuildContext context) async {
    //   final pickedFile = await ImagePicker().getImage(
    //     source: ImageSource.gallery,
    //   );
    //   setState(() {
    //     imageFile = pickedFile!;
    //   });

    //   Navigator.pop(context);
    // }

    // void _openCamera(BuildContext context) async {
    //   final pickedFile = await ImagePicker().getImage(
    //     source: ImageSource.camera,
    //   );
    //   setState(() {
    //     imageFile = pickedFile!;
    //   });
    //   Navigator.pop(context);
    // }
  }
}
