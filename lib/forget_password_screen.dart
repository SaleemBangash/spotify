import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var etEmail = TextEditingController();
  var etPassworf = TextEditingController();
  var etConfirmPassword = TextEditingController();

  String dob = "Date of birth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30, bottom: 20),
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: etEmail,
                  validator: (email) => email!.isEmpty ? 'Required' : null,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Email",
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      locale: LocaleType.en,
                      onChanged: (date) {
                        print('change $date');
                        setState(() {
                          dob = "${date.day}-${date.month}-${date.year}";
                        });
                      },
                      onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          dob = "${date.day}-${date.month}-${date.year}";
                        });
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        dob,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: etPassworf,
                  validator: (email) => email!.isEmpty ? 'Required' : null,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Password",
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: etConfirmPassword,
                  validator: (email) => email!.isEmpty ? 'Required' : null,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Confirm Password",
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    forgetPassword();
                  },
                  child: Container(
                    height: 40,
                    // width: 120,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      "Forget Password",
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
          ),
        ));
  }

  forgetPassword() async {
    var params = {
      "email": etEmail.text.trim(),
      "dob": dob,
      "password": etPassworf.text.trim(),
      "c_password": etPassworf.text.trim(),
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/forgotPassword');

    var response = await http.post(url, body: params);
    if (response.statusCode == 200) {
      // print('IF:::' + response.body);

      var responseBody = json.decode(response.body);

      if (responseBody['success']) {
        Navigator.of(context).pop();
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
                  child: Text(responseBody['message'],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        print('Login failed:email or password incorrect::::::::::::::');
      }
    } else {
      print('ELSE::something went wrong:' + response.statusCode.toString());
    }
  }
}
