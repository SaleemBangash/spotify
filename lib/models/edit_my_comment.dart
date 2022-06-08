// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Editing_the_post.dart';
import 'package:spotify/INterests.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:http/http.dart' as http;

import '../variables/variables.dart';

class EditMyComment extends StatefulWidget {
  String comment_id;
  EditMyComment({Key? key, required this.comment_id}) : super(key: key);

  @override
  State<EditMyComment> createState() => _EditMyCommentState();
}

class _EditMyCommentState extends State<EditMyComment> {
  bool aChecked = false;
  bool bChecked = false;
  bool cChecked = false;
  bool isChecked = false;
  get value => null;
  var nameController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String comment_id = '';

  @override
  Widget build(BuildContext context) {
    var checkBoxValue = false;
    var onChanged;
    bool value = false;
    int _site = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Comment"),
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
                            hintText: "Add Some Comment",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.emailAddress,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // String comment = nameController.text;
                        // String email = emailController.text;
                        registerUser(
                          widget.comment_id,
                          nameController.text,
                        );
                      }
                      print(
                        widget.comment_id,
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
                        "Edit Comment",
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

  registerUser(
    String comment_id,
    String comment,
  ) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    Map<String, dynamic> registerMap = {
      // "image": imageFile,
      "comment_id": comment_id,
      "comment": comment,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/editComment');

    var response =
        await http.post(url, body: jsonEncode(registerMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
        print('Comment Updated:::::::::::::::' + responseBody['message']);
        // navigate to home
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
                  child: Text("Comment Edited Successfuly",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => (UpdateProfile())));
        nameController.clear();
        setState(() {
          commentList[0].comment = comment;
        });
      } else {
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
                  child: Text("Profile Not Updated",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        print('MESSAGE:::::::' + responseBody['message']);
      }
    } else {
      print('ELSE::something went wrong:' + response.statusCode.toString());
    }
  }
}
