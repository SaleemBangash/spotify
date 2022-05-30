// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:http/http.dart' as http;

import 'variables/variables.dart';

class MakeOffer extends StatefulWidget {
  String receiver_id;
  MakeOffer({Key? key, required this.receiver_id}) : super(key: key);

  @override
  State<MakeOffer> createState() => _MakeOfferState();
}

class _MakeOfferState extends State<MakeOffer> {
  var amountController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Make Offer",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff272525),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (BottomBar())));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Azan Malik",
                        style: TextStyle(
                            fontSize: 23.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // SizedBox(
                      //     width: 290,
                      //     height: 45,
                      //     child: TextFormField(
                      //       style: TextStyle(height: 1.5),
                      //       decoration: InputDecoration(
                      //           border: OutlineInputBorder(
                      //               borderSide:
                      //                   BorderSide(color: Colors.black, width: 2.0),
                      //               borderRadius: BorderRadius.circular(15)),
                      //           hintText: "Name",
                      //           filled: true,
                      //           contentPadding: EdgeInsets.symmetric(
                      //               vertical: 10, horizontal: 10)),
                      //       keyboardType: TextInputType.text,
                      //     )),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      // Center(
                      //   child: SizedBox(
                      //       width: 290,
                      //       height: 45,
                      //       child: TextFormField(
                      //         style: TextStyle(height: 1.5),
                      //         decoration: InputDecoration(
                      //             border: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     color: Colors.black, width: 2.0),
                      //                 borderRadius: BorderRadius.circular(15)),
                      //             hintText: "Contact",
                      //             filled: true,
                      //             contentPadding: EdgeInsets.symmetric(
                      //                 vertical: 10, horizontal: 10)),
                      //         keyboardType: TextInputType.phone,
                      //       )),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      SizedBox(
                          width: 290,
                          // height: 45,
                          child: TextFormField(
                            controller: amountController,
                            validator: (amount) =>
                                amount!.isEmpty ? 'Required' : null,
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: "Amount/Month",
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            keyboardType: TextInputType.number,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 290,
                          height: 90,
                          child: TextFormField(
                            controller: descController,
                            validator: (description) =>
                                description!.isEmpty ? 'Required' : null,
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: "Descryption",
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            keyboardType: TextInputType.text,
                            maxLines: 5,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // String comment = nameController.text;
                            // String email = emailController.text;
                            registerUser(widget.receiver_id,
                                amountController.text, descController.text);
                          }
                          print(
                            amountController.text,
                          );
                          print(
                            descController.text,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => BottomBar())));
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
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 17,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => (Login())));
                      //   },
                      //   child: Text(
                      //     "SignIn",
                      //     style: TextStyle(
                      //         fontSize: 17.0,
                      //         fontStyle: FontStyle.normal,
                      //         color: Colors.black),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  registerUser(String receiver_id, String amount, String description) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, dynamic> offerMap = {
      "receiver_id": receiver_id,
      "ammount": amount,
      "description": description,
    };
    print(offerMap);
    print("::::::::::::::::::::::::::::::::::::::::::");
    var url = Uri.parse('http://spotify.bhattihospital.com/api/createOffer');

    var response =
        await http.post(url, body: jsonEncode(offerMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['message'] == 'Offer Created') {
        /// navigate to login screen
        print('MESSAGE:::::::' + responseBody['message']);
      }
    } else {
      print('ELSE:::' + response.statusCode.toString());
    }
  }
}
