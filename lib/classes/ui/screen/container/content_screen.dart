import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/ui/screen/app_list.dart';
import 'package:philips_remote/classes/ui/screen/channel_list.dart';
import 'package:philips_remote/classes/ui/screen/favorite_list.dart';
import 'package:philips_remote/classes/ui/screen/control_screen.dart';
import 'package:philips_remote/classes/ui/screen/settings_screen.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final CupertinoTabController _controller = CupertinoTabController();

  @override
  void initState() {
    _controller.index = 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _controller,
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        activeColor: Theme.of(context).highlightColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Channels"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            title: Text("Favorites"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            title: Text("Controls"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("Apps"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return ChannelsScreen();
          case 1:
            return FavoritesScreen();
          case 2:
            return RemoteUI();
          case 3:
            return AppsScreen();
          case 4:
            return SettingsScreen();
          default:
            return Placeholder();
        }
      },
    );
  }
}
