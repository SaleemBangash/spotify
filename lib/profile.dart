// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/update_profile.dart';
import 'package:spotify/variables/variables.dart';

import 'Community.dart';
import 'login.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var bioController = TextEditingController();
  var dobController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  PickedFile? imageFile = null;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('::::::::::::::::::::::::::::::::');
    // print(profileList[0].image);
    // print('::::::::::::::::::::::::::::::::');
    nameController.text = profileList[0].name;
    emailController.text = profileList[0].email;
    bioController.text = profileList[0].bio.toString();
    dobController.text = profileList[0].dob.toString();
  }

  String dob = "Date of birth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "Update Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => _showChoiceDialog(context),
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // shape: BoxShape.circle,
                        ),
                        width: 100.0,
                        height: 100.0,
                        // color: Colors.green,
                        child: (imageFile == null)
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(shape: BoxShape.circle
                                    // image: DecorationImage(
                                    //   image:
                                    //       const AssetImage('assets/images/john.jpg'),
                                    //   fit: BoxFit.fill,
                                    // ),
                                    ),
                                child: ClipOval(
                                    child: Image.network(
                                  profileList[0].image,
                                  fit: BoxFit.cover,
                                )),
                              )
                            // Text("Choose Image")
                            : Image.file(
                                File(imageFile!.path),
                                // width: 290,
                                // height: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 290,
                      height: 45,
                      child: TextFormField(
                        controller: nameController,
                        validator: (name) => name!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            // border: OutlineInputBorder(
                            //   borderSide:
                            //       BorderSide(color: Colors.black, width: 2.0),
                            // ),
                            hintText: "Name",
                            // filled: true,
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
                        controller: emailController,
                        validator: (email) =>
                            email!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            // border: OutlineInputBorder(
                            //     borderSide:
                            //         BorderSide(color: Colors.black, width: 2.0),
                            //     borderRadius: BorderRadius.circular(15)),
                            hintText: "Email",
                            // filled: true,
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
                        controller: bioController,
                        validator: (bio) => bio!.isEmpty ? 'Required' : null,
                        style: TextStyle(height: 1.5),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.biotech),
                            // border: OutlineInputBorder(
                            //     borderSide:
                            //         BorderSide(color: Colors.black, width: 2.0),
                            //     borderRadius: BorderRadius.circular(15)),
                            hintText: "Bio",
                            // filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.text,
                      )),
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
                            prefixIcon: Icon(Icons.password_outlined),
                            // border: OutlineInputBorder(
                            //     borderSide:
                            //         BorderSide(color: Colors.black, width: 2.0),
                            //     borderRadius: BorderRadius.circular(15)),
                            hintText: "Password",
                            // filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        keyboardType: TextInputType.emailAddress,
                      )),
                  SizedBox(
                    height: 20,
                  ),
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
                      width: 290,
                      height: 45,

                      // width: MediaQuery.of(context).size.width,
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
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String bio = bioController.text;
                        String dob = dobController.text;
                        // String imageFile = PickedFile.imageFile;
                        if (imageFile == null) {
                        } else {
                          registerUser(name, email, bio, password, dob);
                          updateProfileData();
                        }
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _showChoiceDialog(BuildContext context) async {
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  registerUser(
    String name,
    String email,
    String bio,
    String password,
    String dob,
  ) async {
    print("Called ::::::::::::::::::::::::::::::::::::::");

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };

    Map<String, dynamic> registerMap = {
      // "image": imageFile,
      "name": name,
      "email": email,
      "bio": bio,
      "password": password,
      "dob": dob
    };

    var url = Uri.parse('http://spotify.bhattihospital.com/api/updateProfile');

    var response =
        await http.post(url, body: jsonEncode(registerMap), headers: header);
    if (response.statusCode == 200) {
      print('IF:::' + response.body);
      var responseBody = json.decode(response.body);
      if (responseBody['success']) {
        /// navigate to login screen
        print('Comment Edited:::::::::::::::' + responseBody['message']);
        // navigate to home
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
        //           child: Text("Profile Updated Successfuly",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(color: Colors.black, fontSize: 15)),
        //         ),
        //       ),
        //     );
        //   },
        // );
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Profile Updated"),
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (BottomBar())));
        passwordController.clear();
        // setState(() {
        //   profileList[0].name = name;
        //   profileList[0].email = email;
        //   profileList[0].bio = bio;
        //   profileList[0].dob = dob;
        // });
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

  void updateProfileData() async {
    String path = imageFile!.path;

    String token = userModel.token;
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer " + userModel.token
    };
    Map<String, String> registerMap = {
      // "image": imageFile,
      "name": nameController.text,
      "email": emailController.text,
      "bio": bioController.text,
      "password": passwordController.text,
      "dob": dobController.text
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://spotify.bhattihospital.com/api/updateProfile'),
    );

    request.headers.addAll(header);
    request.fields.addAll(registerMap);

    var multipartFile = await http.MultipartFile.fromPath(
        'image', path); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr);
    if (response.statusCode == 200) {
      // success
      print("PROFILE IMAGE UPDATED:::::::::::::::::::::::::::::::");
    } else {
      // error
      print("PROFILE IMAGE NOT UPDATED:::::::::::::::::::::::::::::::");
    }
  }
}
