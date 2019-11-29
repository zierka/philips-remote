import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/ui/screen/app_list.dart';
import 'package:philips_remote/classes/ui/screen/channel_list.dart';
import 'package:philips_remote/classes/ui/screen/favorite_list.dart';
import 'package:philips_remote/classes/ui/screen/pair_screen.dart';
import 'package:philips_remote/classes/ui/screen/remote_ui.dart';
import 'package:philips_remote/classes/ui/screen/settings_screen.dart';

class ContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
            icon: Icon(Icons.star_border),
            title: Text("Apps"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Remote"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_hub),
            title: Text("Pair"),
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
            return AppsScreen();
          case 3:
            return RemoteUI();
          case 4:
            return SettingsScreen();
          case 5:
            return PairScreen();
          default:
            return Placeholder();
        }
      },
    );
  }
}
