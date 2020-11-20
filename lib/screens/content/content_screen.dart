import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/screens/content/channel_list_screen.dart';
import 'package:phimote/screens/content/content_screen_model.dart';
import 'package:phimote/screens/content/control_screen.dart';
import 'package:phimote/screens/settings/settings_screen.dart';
import 'package:phimote/widgets/message.dart';
import 'package:phimote/widgets/message_overlay.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with WidgetsBindingObserver {
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
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    model.resume();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    model.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        model.resume();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
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
            child: MessageOverlay(
              messageStream: model.messageStream,
            ),
          ),
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
