// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/login.dart';
import 'package:spotify/sportsinterest.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
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
                  context, MaterialPageRoute(builder: (context) => (Login())));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 290,
                      height: 45,
                      child: TextFormField(
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Search",
                            filled: true,
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.emailAddress,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 290,
                      height: 45,
                      child: TextFormField(
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
                  Center(
                    child: SizedBox(
                        width: 290,
                        height: 45,
                        child: TextFormField(
                          style: TextStyle(height: 1.5),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: "Contact",
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10)),
                          keyboardType: TextInputType.phone,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 290,
                      height: 45,
                      child: TextFormField(
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
                      height: 90,
                      child: TextFormField(
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (interestedsports())));
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
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
