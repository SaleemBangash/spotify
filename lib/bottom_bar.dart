// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/Chattroom.dart';
import 'package:spotify/Community.dart';
import 'package:spotify/Searchbar.dart';
import 'package:spotify/Home.dart';
import 'package:spotify/community_two.dart';
import 'package:spotify/create_post.dart';
import 'package:spotify/getstarted.dart';
import 'package:spotify/new_chat.dart';
import 'package:spotify/profile.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:spotify/update_profile.dart';

import '../main.dart';
import 'variables/variables.dart';

class BottomBar extends StatefulWidget {
  // final Widget body;
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  // int index = 0;
  // late final Widget? body;
  int _selectedIndex = 0;
  final List<Widget> screens = [
    Home(),
    SearchBar(),
    CommunityTwo(),
    CreatePost(
        // community_id: csearchList[0].interest_id,
        ),
    NewcChat(),
    UpdateProfile()
    //Center(child: Text("Settings")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: widget.body,
      body: Center(
        child: screens[_selectedIndex], //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        // key: globalKey,
        type: BottomNavigationBarType.fixed,
        // currentIndex: _currentIndex,
        backgroundColor: Colors.grey,

        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 0.0),
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        showSelectedLabels: true,
        selectedIconTheme: const IconThemeData(size: 27),
        // unselectedIconTheme: const IconThemeData(size: 22),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.black,
        // selectedLabelStyle: Colors.accents,
        // unselectedLabelStyle: textTheme.caption,
        // onTap: _onItemTapped,
        // currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 21,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cabin,
              size: 21,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.plusCircle,
              size: 21,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.facebookMessenger,
              size: 21,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              size: 25,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.black,
        // selectedFontSize: 20,

        onTap: _onItemTapped,
      ),
    );
  }
}
