// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/community_one.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'models/c_search_model.dart';
import 'variables/variables.dart';

class CommunityTwo extends StatefulWidget {
  const CommunityTwo({Key? key}) : super(key: key);

  @override
  _CommunityTwoState createState() => _CommunityTwoState();
}

class _CommunityTwoState extends State<CommunityTwo> {
  bool aChecked = false;
  bool bChecked = false;
  bool cChecked = false;
  bool isChecked = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String community_id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Communities", style: TextStyle(color: Colors.white)),
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
                SizedBox(
                  height: 10,
                ),
                //Search baar
                SizedBox(
                    width: 310,
                    // height: 45,
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
                      keyboardType: TextInputType.emailAddress,
                    )),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: csearchList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 90,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/download.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    Text(csearchList[index].community_name)
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    // String comment = nameController.text;
                                    // String email = emailController.text;
                                    registerUser(csearchList[index].id);
                                  }
                                  print(community_id);
                                },
                                child: Container(
                                  height: 30,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
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
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  serachUser() async {
    if (csearchList.isNotEmpty) {
      csearchList.clear();
    }
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/searchCommunity/' +
            nameController.text);
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      print("RESPONSE DATA " + jsonBody.toString());
      for (int i = 0; i < jsonBody['users'].length; i++) {
        csearchList.add(CSearchModel(
            id: jsonBody['users'][i]['id'].toString(),
            interest_id: jsonBody['users'][i]['interest_id'].toString(),
            user_id: jsonBody['users'][i]['user_id'].toString(),
            community_name: jsonBody['users'][i]['community_name'].toString(),
            created_at: jsonBody['users'][i]['created_at'].toString(),
            updated_at: jsonBody['users'][i]['updated_at'].toString()));
      }
      // setState(() {});
    }
  }

  registerUser(String community_id) async {
    print("Request Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> requestMap = {
      "community_id": community_id,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/joinCommunity');

    var response =
        await http.post(url, body: jsonEncode(requestMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['message'] == 'Community Join Successfuly') {
        /// navigate to login screen
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(responseBody['message']),
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
}