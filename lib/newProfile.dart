// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify/bottom_bar.dart';
import 'package:spotify/profile.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  TextEditingController _controller = TextEditingController();
  TextEditingController newcontroller = TextEditingController();
  TextEditingController oldcontroller = TextEditingController();
  TextEditingController Pcontroller = TextEditingController();
  bool _isEnable = false;
  bool _atEnable = false;
  bool _onEnable = false;

  String Ftitle = "Azan Malik";
  String title = "Ali";
  String Ctitle = "12345678";
  String Ptitle = "11223344";
  bool isEditable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff272525),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomBar()));
            }
            //onPressed: () => Navigator.of(context).pop(),
            ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          // margin: EdgeInsets.only(top: 20),
          // color: Color(0xffEBEBEB),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // Image.asset(
                      //   'assets/person_2.png',
                      //   width: 70.0,
                      //   height: 70.0,
                      //   fit: BoxFit.cover,
                      // ),

                      GestureDetector(
                        onTap: () => _showChoiceDialog(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              // shape: BoxShape.circle,
                            ),
                            width: 70.0,
                            height: 70.0,
                            // color: Colors.green,
                            child: (imageFile == null)
                                ? Image.asset(
                                    'assets/person.png',
                                    width: 70.0,
                                    height: 70.0,
                                    fit: BoxFit.cover,
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      _isEnable = true;
                                    });
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: 300,
                            child: Expanded(
                                child: !_isEnable
                                    ? Text(title)
                                    : TextFormField(
                                        initialValue: title,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() => {
                                                isEditable = false,
                                                title = value
                                              });
                                        })),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Father Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      isEditable = true;
                                    });
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: 300,
                            child: Expanded(
                                child: !isEditable
                                    ? Text(Ftitle)
                                    : TextFormField(
                                        initialValue: Ftitle,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() => {
                                                isEditable = false,
                                                Ftitle = value
                                              });
                                        })),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Contact",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      _atEnable = true;
                                    });
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: 300,
                            child: Expanded(
                                child: !_atEnable
                                    ? Text(Ctitle)
                                    : TextFormField(
                                        keyboardType: TextInputType.phone,
                                        initialValue: Ctitle,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() => {
                                                _atEnable = false,
                                                Ctitle = value
                                              });
                                        })),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      _onEnable = true;
                                    });
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: 300,
                            child: Expanded(
                                child: !_onEnable
                                    ? Text(Ptitle)
                                    : TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        initialValue: Ptitle,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (value) {
                                          setState(() => {
                                                _onEnable = false,
                                                Ptitle = value
                                              });
                                        })),
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
                                    builder: (context) => (NewProfile())));
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PickedFile? imageFile = null;

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
}
