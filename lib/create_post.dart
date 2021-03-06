// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify/Editing_the_post.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/profile.dart';
import 'package:spotify/show_community_post.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:http/http.dart' as http;

import 'models/all_community_model.dart';
import 'models/community_model.dart';
import 'variables/variables.dart';

class CreatePost extends StatefulWidget {
  // String community_id;
  const CreatePost({
    Key? key,
    // required this.community_id,
  }) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String community_id = '';
  List<CommunityModel> communityList = [];
  String? dropvalue;
  String _text = 'home';
  // changeText() {
  //   setState(() {
  //     _text = communityList[0].id.toString();
  //   });
  // }

  var items = [
    'Home',
    'Community One',
    'Community Two',
    'Community Three',
  ];
  PickedFile? imageFile = null;

  var nameController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descController.text = _text;
    // getCommunityList(community_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Create Post", style: TextStyle(color: Colors.white)),
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
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   community_id = communityList[0].id;
                      // });

                      getCommunityshowList();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        margin: EdgeInsets.all(19),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 217, 217),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        height: 40,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Show Community',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   community_id = communityList[0].id;
                      // });

                      getCommunityList();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        margin: EdgeInsets.all(19),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 217, 217),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        height: 40,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select Community',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showChoiceDialog(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // shape: BoxShape.circle,
                        ),
                        width: 300.0,
                        height: 330.0,
                        // color: Colors.green,
                        child: (imageFile == null)
                            ? Container(
                                width: 300.0,
                                height: 370.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                  // shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.upload),
                              )
                            // Text("Choose Image")
                            : Image.file(
                                File(imageFile!.path),
                                // width: 290,
                                // height: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 290,
                      height: 90,
                      child: TextFormField(
                        // onChanged: (value) => changeText(),
                        controller: descController,
                        validator: (desc) => desc!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Add home",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 290,
                      height: 90,
                      child: TextFormField(
                        controller: nameController,
                        validator: (name) => name!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Add Some Text",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        String desc = descController.text;
                        String name = nameController.text;

                        setState(() {
                          community_id = descController.text;
                          print("Community:::::::::::::::::::::::::::" +
                              community_id);
                        });

                        // String imageFile = PickedFile.imageFile;
                        if (imageFile == null) {
                          // registerUser(community_id, nameController.text);
                        } else {
                          updateProfileData();
                          // registerUser(community_id, nameController.text);
                        }
                      }
                      // print(community_id);
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: communityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // community_id = communityList[index].id;
                                  print(
                                      "Community_id:::::::::::::::::::::::::::" +
                                          communityList[index].id);
                                  descController.text = communityList[index].id;
                                });

                                // setState(() {
                                //   _text = communityList[index].id;
                                // });
                                Navigator.of(context).pop();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             (ShowCommunityPost(
                                //               communityPost_id:
                                //                   communityList[index].id,
                                //             ))));
                              },
                              child: Text(
                                communityList[index].community_name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      );
                    }));
          });
        });
  }

  _showCommunityModalBottomSheet(context) {
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: communityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // community_id = communityList[index].id;
                                  print(
                                      "Community_id:::::::::::::::::::::::::::" +
                                          communityList[index].id);
                                  // descController.text = communityList[index].id;
                                });

                                // setState(() {
                                //   _text = communityList[index].id;
                                // });
                                // Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (ShowCommunityPost(
                                              communityPost_id:
                                                  communityList[index].id,
                                            ))));
                              },
                              child: Text(
                                communityList[index].community_name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      );
                    }));
          });
        });
  }

  _allCommunityModalBottomSheet(context) {
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allCommunityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              allCommunityList[index].community_name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    }));
          });
        });
  }

  // Future<void> _showChoiceDialog(BuildContext context) async {
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  // registerUser(
  //   String community_id,
  //   String description,
  // ) async {
  //   print("Called ::::::::::::::::::::::::::::::::::::::");

  //   Map<String, String> header = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     "Authorization": "Bearer " + userModel.token
  //   };

  //   Map<String, dynamic> registerMap = {
  //     // "image": imageFile,
  //     "community_id": community_id,
  //     "description": description,
  //   };

  //   var url = Uri.parse('http://spotify.bhattihospital.com/api/savePost');

  //   var response =
  //       await http.post(url, body: jsonEncode(registerMap), headers: header);
  //   if (response.statusCode == 200) {
  //     print('IF:::' + response.body);
  //     var responseBody = json.decode(response.body);
  //     if (responseBody['success']) {
  //       /// navigate to login screen
  //       print('Post Created:::::::::::::::' + responseBody['message']);
  //       showDialog(
  //         barrierDismissible: true,
  //         // barrierColor: Theme.of(context).primaryColor,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15.0)), //this right here,
  //             backgroundColor: Colors.white,
  //             content: Container(
  //               height: 50,
  //               child: Center(
  //                 child: Text(responseBody['message'],
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(color: Colors.black, fontSize: 15)),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //       // _scaffoldKey.currentState!.showSnackBar(SnackBar(
  //       //   content: Text("Profile Updated"),
  //       // ));
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context) => (UpdateProfile())));
  //       nameController.clear();
  //       descController.clear();
  //       // setState(() {
  //       //   // communityList[0].community_name = community_name;
  //       //   // profileList[0].email = email;
  //       //   // profileList[0].bio = bio;
  //       // });
  //     } else {
  //       // showDialog(
  //       //   barrierDismissible: true,
  //       //   // barrierColor: Theme.of(context).primaryColor,
  //       //   context: context,
  //       //   builder: (BuildContext context) {
  //       //     return AlertDialog(
  //       //       shape: RoundedRectangleBorder(
  //       //           borderRadius: BorderRadius.circular(15.0)), //this right here,
  //       //       backgroundColor: Colors.white,
  //       //       content: Container(
  //       //         height: 50,
  //       //         child: Center(
  //       //           child: Text("Profile Not Updated",
  //       //               textAlign: TextAlign.center,
  //       //               style: TextStyle(color: Colors.black, fontSize: 15)),
  //       //         ),
  //       //       ),
  //       //     );
  //       //   },
  //       // );

  //       print('MESSAGE:::::::' + responseBody['message']);
  //     }
  //   } else {
  //     print('ELSE::something went wrong:' + response.statusCode.toString());
  //   }
  // }

  void updateProfileData() async {
    String path = imageFile!.path;

    String token = userModel.token;
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, String> registerMap = {
      // "image": imageFile,
      "community_id": descController.text,
      "description": nameController.text,
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://spotify.bhattihospital.com/api/savePost'),
    );

    request.headers.addAll(header);
    request.fields.addAll(registerMap);

    var multipartFile = await http.MultipartFile.fromPath(
        'postImage', path); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr);
    if (response.statusCode == 200) {
      showDialog(
          barrierDismissible: true,
          // barrierColor: Theme.of(context).primaryColor,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)), //this right here,
              backgroundColor: Colors.white,
              content: Container(
                height: 50,
                child: Center(
                  child: Text("Post Created Successfuly",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          });
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => BottomBar())));

      print("PROFILE IMAGE UPDATED:::::::::::::::::::::::::::::::");
      nameController.clear();
      descController.clear();
    } else {
      // error
      print("PROFILE IMAGE NOT UPDATED:::::::::::::::::::::::::::::::");
    }
  }

  void getCommunityList() async {
    // if (communityList.isNotEmpty) {
    //   communityList.clear();
    // }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse('http://spotify.bhattihospital.com/api/communityList'),
        headers: header);
    if (response.statusCode == 200) {
      setState(() {
        var jsonBody = json.decode(response.body);
        for (int i = 0; i < jsonBody['message'].length; i++) {
          communityList.add(CommunityModel(
            id: jsonBody['message'][i]['id'].toString(),
            community_name: jsonBody['message'][i]['community_name'].toString(),
          ));
        }
        setState(() {});
        _playlistModalBottomSheet(context);
      });
    }
  }

  void getAllCommunityList() async {
    if (allCommunityList.isNotEmpty) {
      allCommunityList.clear();
    }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse('http://spotify.bhattihospital.com/api/allCommunity'),
        headers: header);
    if (response.statusCode == 200) {
      setState(() {
        var jsonBody = json.decode(response.body);

        setState(() {
          for (int i = 0; i < jsonBody['message'].length; i++) {
            allCommunityList.add(AllCommunityModel(
              id: jsonBody['message'][i]['id'].toString(),
              interest_id: jsonBody['message'][i]['interest_id'].toString(),
              user_id: jsonBody['message'][i]['user_id'].toString(),
              community_name:
                  jsonBody['message'][i]['community_name'].toString(),
              created_at: jsonBody['message'][i]['created_at'].toString(),
              updated_at: jsonBody['message'][i]['updated_at'].toString(),
            ));
          }
        });
        _allCommunityModalBottomSheet(context);
      });
    }
  }

  void getCommunityshowList() async {
    if (communityList.isNotEmpty) {
      communityList.clear();
    }
    print("POST FUNCTION CALLED:::::::::::::::::::::::::::" + userModel.token);
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var response = await http.get(
        Uri.parse('http://spotify.bhattihospital.com/api/communityList'),
        headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      for (int i = 0; i < jsonBody['message'].length; i++) {
        communityList.add(CommunityModel(
          id: jsonBody['message'][i]['id'].toString(),
          community_name: jsonBody['message'][i]['community_name'].toString(),
        ));
      }
      setState(() {});
      _showCommunityModalBottomSheet(context);
    }
  }
}
