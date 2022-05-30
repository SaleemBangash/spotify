// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify/Home.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/models/user_model.dart';
import 'package:spotify/registration.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/sportsinterest.dart';
import 'package:spotify/variables/variables.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
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
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
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
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text;
                          String password = passwordController.text;

                          loginUser(email, password);
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
                          "SignIn",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (Registration())));
                      },
                      child: Text(
                        "Create account",
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

  loginUser(String email, String password) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");
    Map<String, dynamic> loginMap = {
      "email": email,
      "password": password,
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/login');

    var response = await http.post(url, body: loginMap);
    if (response.statusCode == 200) {
      // print('IF:::' + response.body);

      var responseBody = json.decode(response.body);

      if (responseBody['success']) {
        print('Login Done:::::::::::::::' + responseBody['user']['name']);

        setState(() {
          userModel = UserModel(
              token: responseBody['user']['token'],
              id: responseBody['user']['id'].toString(),
              name: responseBody['user']['name'],
              username: responseBody['user']['userName'].toString(),
              email: responseBody['user']['email']);
          print(userModel.token);
        });
        // _scaffoldKey.currentState!.showSnackBar(SnackBar(
        //   content: Text("Signing In"),
        // ));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => interestedsports()));
        // _scaffoldKey.currentState!.showSnackBar(SnackBar(
        //   content: Text("Signing In"),
        // ));
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
                  child: Text("Login failed email or password incorrect",
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
