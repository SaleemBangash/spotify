// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/new_chat.dart';
import 'package:spotify/offer.dart';
import 'package:http/http.dart' as http;

import 'health.dart';
import 'models/new_chat_model.dart';
import 'variables/variables.dart';

class chatt extends StatefulWidget {
  String receiver_id;

  chatt({Key? key, required this.receiver_id}) : super(key: key);

  @override
  State<chatt> createState() => _chattState();
}

class _chattState extends State<chatt> {
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     registerUser(reciever_id, message);
//   }

  // List<CommentModel> commentList = [];

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String receiver_id = '';
  String uname = '';
  List<NewChatModel> newchatList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showpostcomments(widget.receiver_id);
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
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                (MakeOffer(receiver_id: widget.receiver_id))));
                  },
                  child:
                      Icon(FontAwesomeIcons.plusCircle, color: Colors.white)),
            ),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: newchatList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onLongPress: () => showDialog(
                              barrierDismissible: true,
                              // barrierColor: Theme.of(context).primaryColor,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
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
                                              deleteChat(newchatList[index].id);
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
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.close),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text("Cancel",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
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
                            child: Align(
                              alignment:
                                  newchatList[index].send_id == userModel.id
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatList[0].name,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    newchatList[index].time,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.transparent),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        newchatList[index].message,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // String comment = nameController.text;
                            // String email = emailController.text;
                            registerUser(
                                widget.receiver_id, nameController.text);
                            print(widget.receiver_id);
                          }
                          print(nameController.text);
                        },
                        child: Icon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.black,
                        ),
                      ),
                      filled: true,

                      fillColor: Colors.grey[200],
                      // icon: Icon(Icons.phone),
                      hintText: "Type Something",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  registerUser(String receiver_id, String message) async {
    print("Chat Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> chatMap = {
      "receiver_id": receiver_id,
      "message": message,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/sendMessage');

    var response =
        await http.post(url, body: jsonEncode(chatMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['message'] == 'Message send successfully') {
        //newchatList.add(NewChatModel(id: id, send_id: send_id, receiver_id: receiver_id, message: message, time: time, status: status, created_at: created_at, updated_at: updated_at));
        Navigator.of(context).pop();

        /// navigate to login screen
        print('MESSAGE:::::::' + responseBody['message']);
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  showpostcomments(String receiver_id) async {
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
        'http://spotify.bhattihospital.com/api/ViewConversation/' +
            receiver_id);

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
        for (int i = 0; i < responseBody['message'].length; i++) {
          newchatList.add(NewChatModel(
              id: responseBody['message'][i]['id'].toString(),
              send_id: responseBody['message'][i]['send_id'].toString(),
              receiver_id: responseBody['message'][i]['receiver_id'].toString(),
              message: responseBody['message'][i]['message'].toString(),
              time: responseBody['message'][i]['time'].toString(),
              status: responseBody['message'][i]['status'].toString(),
              created_at: responseBody['message'][i]['created_at'].toString(),
              updated_at: responseBody['message'][i]['updated_at'].toString()));
        }
        setState(() {});
        // print('MESSAGE:::::::' + responseBody['message']);
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }

  void deleteChat(String messageID) async {
    var url = Uri.parse(
        'http://spotify.bhattihospital.com/api/DeleteSingleMessage/' +
            messageID);

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

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (BottomBar())));
    }
  }
}
