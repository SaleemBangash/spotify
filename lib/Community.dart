// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Editing_the_post.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:http/http.dart' as http;

import 'variables/variables.dart';

class Community extends StatefulWidget {
  String interest_id;
  Community({Key? key, required this.interest_id}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool aChecked = false;
  bool bChecked = false;
  bool cChecked = false;
  bool isChecked = false;
  get value => null;
  var nameController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // String interest_id = '';

  @override
  Widget build(BuildContext context) {
    var checkBoxValue = false;
    var onChanged;
    bool value = false;
    int _site = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Community"),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => BottomBar())));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 310,
                      // height: 45,
                      child: TextFormField(
                        controller: nameController,
                        validator: (name) => name!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Community Name",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.emailAddress,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                //   child: Text(
                //     "Interests:",
                //     style:
                //         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 100),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 20,
                //         width: 20,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: Colors.black),
                //             shape: BoxShape.circle,
                //             color: Colors.white),
                //         child: Transform.scale(
                //           scale: 0.6,
                //           child: Checkbox(
                //             checkColor: Colors.black,
                //             side: BorderSide(color: Colors.white),
                //             activeColor: Colors.black,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20)),
                //             value: aChecked,
                //             onChanged: (bool? value) {
                //               setState(() {
                //                 aChecked = value!;

                //                 bChecked = false;
                //                 isChecked = false;
                //                 // dChecked = false;
                //                 // eChecked = false;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 5.0,
                //       ),
                //       Text("Tennis",
                //           style: Theme.of(context).textTheme.bodyText2),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 100),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 20,
                //         width: 20,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: Colors.black),
                //             shape: BoxShape.circle,
                //             color: Colors.white),
                //         child: Transform.scale(
                //           scale: 0.6,
                //           child: Checkbox(
                //             checkColor: Colors.black,
                //             side: BorderSide(color: Colors.white),
                //             activeColor: Colors.black,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20)),
                //             value: bChecked,
                //             onChanged: (bool? value) {
                //               setState(() {
                //                 bChecked = value!;

                //                 aChecked = false;
                //                 isChecked = false;
                //                 // dChecked = false;
                //                 // eChecked = false;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 5.0,
                //       ),
                //       Text("Cricket",
                //           style: Theme.of(context).textTheme.bodyText2),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 100),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 20,
                //         width: 20,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: Colors.black),
                //             shape: BoxShape.circle,
                //             color: Colors.white),
                //         child: Transform.scale(
                //           scale: 0.6,
                //           child: Checkbox(
                //             checkColor: Colors.black,
                //             side: BorderSide(color: Colors.white),
                //             activeColor: Colors.black,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20)),
                //             value: isChecked,
                //             onChanged: (bool? value) {
                //               setState(() {
                //                 isChecked = value!;

                //                 bChecked = false;
                //                 aChecked = false;
                //                 // dChecked = false;
                //                 // eChecked = false;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 5.0,
                //       ),
                //       Text("BasketBall",
                //           style: Theme.of(context).textTheme.bodyText2),
                //     ],
                //   ),
                // ),

                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 100),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 20,
                //         width: 20,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: Colors.black),
                //             shape: BoxShape.circle,
                //             color: Colors.white),
                //         child: Transform.scale(
                //           scale: 0.6,
                //           child: Checkbox(
                //             checkColor: Colors.black,
                //             side: BorderSide(color: Colors.white),
                //             activeColor: Colors.black,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20)),
                //             value: cChecked,
                //             onChanged: (bool? value) {
                //               setState(() {
                //                 cChecked = value!;

                //                 bChecked = false;
                //                 aChecked = false;
                //                 isChecked = false;
                //                 // eChecked = false;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 5.0,
                //       ),
                //       Text("FootBall",
                //           style: Theme.of(context).textTheme.bodyText2),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // String comment = nameController.text;
                        // String email = emailController.text;
                        registerUser(
                          widget.interest_id,
                          nameController.text,
                        );
                      }
                      print(
                        widget.interest_id,
                      );
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => BottomBar())));
                    },
                    child: Container(
                      height: 40,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "Create Community",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckbox() => ListTile(
        leading: Checkbox(value: value, onChanged: (value) {}),
        title: Text("Cricket"),
      );

  getcolor(Color? blueGrey, MaterialColor indigo) {
    return MaterialStateProperty.resolveWith((states) => Colors.blue);
  }

  registerUser(String interest_id, String name) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> offerMap = {
      "interest_id": interest_id,
      "name": name,
    };

    var url =
        Uri.parse('http://spotify.bhattihospital.com/api/createCummunity');

    var response =
        await http.post(url, body: jsonEncode(offerMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
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
                  child: Text("Community Created Successfuly",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        print('MESSAGE:::::::' + responseBody['message']);
        nameController.clear();
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }
}
