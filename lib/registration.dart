// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:http/http.dart' as http;

import 'db_config/base_url.dart';

class Registration extends StatefulWidget {
  const Registration({
    Key? key,
  }) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var c_passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 33.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.lightGreen),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 290,
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
                          hintText: "Name",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      keyboardType: TextInputType.text,
                    )),
                SizedBox(
                  height: 20,
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
                //           hintText: "Last Name",
                //           filled: true,
                //           contentPadding:
                //               EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                //       keyboardType: TextInputType.text,
                //     )),
                // SizedBox(
                //   height: 20,
                // ),
                Center(
                  child: SizedBox(
                      width: 290,
                      // height: 45,
                      child: TextFormField(
                        controller: emailController,
                        validator: (email) =>
                            email!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Email",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.emailAddress,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 290,
                    // height: 45,
                    child: TextFormField(
                      controller: passwordController,
                      validator: (password) =>
                          password!.isEmpty ? 'Required' : null,
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Password",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 290,
                    // height: 45,
                    child: TextFormField(
                      controller: c_passwordController,
                      validator: (c_password) =>
                          c_password!.isEmpty ? "Required" : null,
                      style: TextStyle(height: 1.5),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Confirm Password",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    )),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      String name = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String c_password = c_passwordController.text;
                      registerUser(name, email, password, c_password);
                    }
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
                      "SignUp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    )),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Login())));
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  registerUser(
      String name, String email, String password, String c_password) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, dynamic> registerMap = {
      "name": name,
      "email": email,
      "password": password,
      "c_password": c_password
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/registerUser');

    var response = await http.post(url, body: registerMap);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
        print(
            'Registration Done:::::::::::::::' + responseBody['user']['name']);
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
                  child: Text("Registration Successful",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login()));
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
                  child: Text(
                      "Registration failed this email is already registered",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            );
          },
        );

        print('Registration failed:email or password incorrect::::::::::::::');
      }
    } else {
      print('ELSE::something went wrong:' + response.statusCode.toString());
    }
  }
}
