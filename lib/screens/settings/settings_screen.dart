import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:package_info/package_info.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/screens/root/root_model.dart';
import 'package:phimote/screens/settings/general_settings_screen.dart';
import 'package:phimote/screens/settings/settings_screen_model.dart';
import 'package:phimote/util/extensions/dialog.dart';
import 'package:phimote/util/flows.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

// String _appStoreId = "1214299218";
String _privacyPolicyUrl = "https://ranchero.com/netnewswire/privacypolicy";
// String _twitterHandle = "@zierka";
// String _twitterHandleUrl = "https://twitter.com/zierka";

enum _SettingsItem {
  general,
  feedback,
  // twitter,
  // rate,
  // privacyPolicy,
  // licenses,
}

extension on _SettingsItem {
  // ignore: missing_return
  String get title {
    switch (this) {
      case _SettingsItem.general:
        return "General";
      case _SettingsItem.feedback:
        return "Send feedback";
      // case _SettingsItem.twitter:
      //   return "$_twitterHandle on twitter";
      // case _SettingsItem.rate:
      //   return "Rate app";
      // case _SettingsItem.privacyPolicy:
      //   return "Privacy Policy";
      // case _SettingsItem.licenses:
      //   return "Licenses";
    }
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _model = SettingsScreenModel();

  final items = _SettingsItem.values;

  String version = "";

  @override
  void initState() {
    super.initState();

    _loadVersion();
  }

  _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    setState(() {
      this.version = "$version+$buildNumber";
    });
  }

  Future _action(_SettingsItem item, BuildContext context) async {
    switch (item) {
      case _SettingsItem.general:
        Analytics.track("general settings tap");

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GeneralSettingsScreen(),
          ),
        );
        break;
      case _SettingsItem.feedback:
        Analytics.track("feedback tap", properties: {"source": "settings"});

        await startSendFeedbackFlow(context);

        break;
      // case _SettingsItem.twitter:
      //   if (await canLaunch(_twitterHandleUrl)) {
      //     await launch(_twitterHandleUrl);
      //   }
      //   break;
      // case _SettingsItem.rate:
      //   final inAppReview = InAppReview.instance;
      //   inAppReview.openStoreListing(appStoreId: _appStoreId);
      //   break;
      // case _SettingsItem.privacyPolicy:
      //   if (await canLaunch(_privacyPolicyUrl)) {
      //     await launch(_privacyPolicyUrl);
      //   }

      //   break;
      // case _SettingsItem.licenses:
      //   showLicensePage(context: context);
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _model.rootModel = Provider.of<RootModel>(context, listen: false);

    return Scaffold(
      appBar: NavigationBar(
        title: Text("Settings"),
        actions: <Widget>[
          FlatButton(
            textColor: Theme.of(context).errorColor,
            child: Text("Unpair"),
            onPressed: () {
              Analytics.track("unpair tap");

              _model.unpair();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListItem(
                  data: ListItemData(item.title, ""),
                  onTap: () => _action(item, context),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          Text(
            version,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: AppColors.greyLight),
          ),
          SizedBox(
              height:
                  max(MediaQuery.of(context).viewPadding.bottom, Paddings.x2)),
        ],
      ),
    );
  }
}
