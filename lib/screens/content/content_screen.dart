import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';
// import 'package:phimote/screens/content/channel_list/channel_list_screen.dart';
import 'package:phimote/screens/content/content_screen_model.dart';
import 'package:phimote/screens/content/control_screen/control_screen.dart';
// import 'package:phimote/screens/settings/settings_screen.dart';
import 'package:phimote/widgets/message_overlay.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with WidgetsBindingObserver {
  // int _selectedTabIndex = 1;

  late ContentScreenModel model;

  // final items = [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.list_alt),
  //     label: "Channels",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.apps),
  //     label: "Controls",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.settings),
  //     label: "Settings",
  //   ),
  // ];

  @override
  void initState() {
    model = ContentScreenModel(context.read);

    WidgetsBinding.instance?.addObserver(this);

    model.resume();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
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
    // TODO: Temp disable tabbar, show controls only
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ChangeNotifierProvider.value(
        value: model,
        child: Stack(
          children: [
            ControlScreen(),
            Positioned(
              bottom:
                  max(MediaQuery.of(context).viewPadding.bottom, Paddings.x5),
              left: Paddings.x2,
              right: Paddings.x2,
              child: MessageOverlay(
                messageStream: model.messageStream,
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   body: Stack(
    //     children: [
    //       ChangeNotifierProvider.value(
    //         value: model,
    //         child: IndexedStack(
    //           index: _selectedTabIndex,
    //           children: [
    //             ChannelListScreen(),
    //             ControlScreen(),
    //             SettingsScreen(),
    //           ],
    //         ),
    //       ),
    //       Positioned(
    //         bottom: Paddings.x1,
    //         left: Paddings.x2,
    //         right: Paddings.x2,
    //         child: MessageOverlay(
    //           messageStream: model.messageStream,
    //         ),
    //       ),
    //     ],
    //   ),
    //   bottomNavigationBar: Theme(
    //     data: Theme.of(context).copyWith(
    //       highlightColor: Platform.isIOS ? Colors.transparent : null,
    //     ),
    //     child: BottomNavigationBar(
    //       showSelectedLabels: false,
    //       showUnselectedLabels: false,
    //       backgroundColor: AppColors.backgroundColor,
    //       currentIndex: _selectedTabIndex,
    //       items: items,
    //       onTap: (index) => onTabTapped(index),
    //     ),
    //   ),
    // );
  }

  // onTabTapped(int index) {
  //   setState(() {
  //     _selectedTabIndex = index;
  //   });
  // }
}
