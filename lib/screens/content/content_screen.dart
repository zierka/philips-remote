import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/screens/content/channel_list_screen.dart';
import 'package:phimote/screens/content/control_screen.dart';
import 'package:phimote/screens/settings/settings_screen.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedTabIndex = 1;

  final items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      title: Text("Channels"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dialpad),
      title: Text("Controls"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("Settings"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: _selectedTabIndex,
        children: [
          ChannelListScreen(),
          ControlScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Platform.isIOS ? Colors.transparent : null,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.backgroundColor,
          currentIndex: _selectedTabIndex,
          items: items,
          onTap: (index) => onTabTapped(index),
        ),
      ),
    );
  }

  onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}
