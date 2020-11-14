import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/screens/content/channel_list_screen.dart';
import 'package:phimote/screens/content/content_screen_model.dart';
import 'package:phimote/screens/content/control_screen.dart';
import 'package:phimote/screens/settings/settings_screen.dart';
import 'package:phimote/widgets/connection_warning.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedTabIndex = 1;

  final ContentScreenModel model = ContentScreenModel();

  final items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "Channels",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dialpad),
      label: "Controls",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        IndexedStack(
          index: _selectedTabIndex,
          children: [
            ChannelListScreen(),
            ControlScreen(),
            SettingsScreen(),
          ],
        ),
        Positioned(
          bottom: Paddings.x1,
          left: Paddings.x2,
          right: Paddings.x2,
          child: StreamBuilder<bool>(
            stream: model.connectionStream,
            builder: (context, snapshot) {
              final connected = snapshot.data;
              final show = snapshot.hasData && !connected;
              return AnimatedOpacity(
                opacity: show ? 0.8 : 0,
                duration: Duration(milliseconds: 200),
                child: ConnectionWarning(),
              );
            },
          ),
        ),
      ]),
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
