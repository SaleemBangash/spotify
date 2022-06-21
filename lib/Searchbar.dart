// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Chattroom.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/models/search_model.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:spotify/view_profile.dart';

import 'variables/variables.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _text = 'Follow';
  bool aChecked = false;
  bool bChecked = false;
  bool cChecked = false;
  bool isChecked = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<SearchModel> searchList = [];
  String follower_id = '';
  // String Status = '';
  // var url = 'http://spotify.bhattihospital.com/api/FollowUser';
  // @override
  // void initState() {
  //   // TODO: implement initState

  //   setState(() {
  //     String Status = searchList[0].status.toString();
  //     print(Status);
  //     super.initState();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //Search baar
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 310,
                    height: 45,
                    child: TextFormField(
                      controller: nameController,
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Search",
                          filled: true,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                serachUser();
                              }),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.text,
                    )),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              // userSearch_id = searchList[0].id;
                              // // receiver_id = chatList[index].reciever_id;
                              // // print("Reciever id::::::::;:" + receiver_id);
                              // print("conn nmbr::::::::;:" + userSearch_id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (ViewProfile(
                                            userSearch_id: searchList[index].id,
                                          ))));
                            },
                            child: Container(
                              height: 90,
                              width: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        searchList[index].image.toString() ==
                                                'null'
                                            ? ClipOval(
                                                child: Image.asset(
                                                  "assets/download.png",
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              )
                                            : ClipOval(
                                                child: Image.network(
                                                  searchList[index].image,
                                                  fit: BoxFit.cover,
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                        Text(
                                          searchList[index].name,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // String comment = nameController.text;
                                              // String email = emailController.text;
                                              // String status = searchList[index]
                                              //     .status
                                              //     .toString();
                                              // Status = searchList[0].status;
                                              // print("Status:::::" + Status);
                                              registerUser(
                                                  searchList[index].id);
                                            }

                                            print(follower_id);
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.cyan,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                _text,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 40,
                                        // ),
                                        Container(
                                          height: 25,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              message_id = searchList[index].id;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => (chatt(
                                                          // receiver_id:
                                                          //     searchList[
                                                          //             index]
                                                          //         .id,
                                                          ))));
                                            },
                                            child: Center(
                                              child: Text(
                                                "Message",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  registerUser(String follower_id) async {
    print("Request Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> requestMap = {
      "follower_id": follower_id,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/FollowUser');

    var response =
        await http.post(url, body: jsonEncode(requestMap), headers: header);
    if (response.statusCode == 200) {
      // setState(() {
      //   _text = 'Following';
      // });
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        setState(() {
          if (searchList[0].status == 0) {
            _text = 'Follow';
          } else {
            _text = 'Following';
          }
        });
      }
      if (responseBody['message'] == 'Friend request Sent Successfuly') {
        /// navigate to login screen
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('User Followed'),
              );
            });

        print('MESSAGE:::::::' + responseBody['message']);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(responseBody['message']),
              );
            });
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  serachUser() async {
    if (searchList.isNotEmpty) {
      searchList.clear();
    }
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/searchUser/' +
        nameController.text);
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      print("RESPONSE DATA " + jsonBody.toString());
      if (jsonBody['success']) {
        for (int i = 0; i < jsonBody['users'].length; i++) {
          searchList.add(SearchModel(
              id: jsonBody['users'][i]['id'].toString(),
              name: jsonBody['users'][i]['name'].toString(),
              image: jsonBody['users'][i]['image'].toString(),
              bio: jsonBody['users'][i]['bio'].toString(),
              status: jsonBody['users'][i]['status'].toString()));
        }
        setState(() {});

        // print('MESSAGE:::::::' + jsonBody['message']);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(jsonBody['message']),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("No user Found"),
            );
          });
    }
  }
}
