import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/screens/content/app_list_screen.dart';
import 'package:philips_remote/screens/content/channel_list_screen.dart';
import 'package:philips_remote/screens/content/control_screen.dart';
import 'package:philips_remote/screens/content/favorite_list_screen.dart';
import 'package:philips_remote/screens/settings/settings_screen.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final _controller = PlatformTabController(initialIndex: 2);

  final items = (BuildContext context) => [
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
      ];

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      tabController: _controller,
      bodyBuilder: (context, index) {
        switch (index) {
          case 0:
            return ChannelListScreen();
          case 1:
            return FavoriteChannelListScreen();
          case 2:
            return ControlScreen();
          case 3:
            return AppListScreen();
          case 4:
            return SettingsScreen();
          default:
            return Placeholder();
        }
      },
      items: items(context),
    );
  }
}
