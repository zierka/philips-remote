import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/main/main_model.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen_model.dart';
import 'package:philips_remote/widgets/my_platform_circular_progress_indicator.dart';
import 'package:provider/provider.dart';

class PairScreen extends StatefulWidget {
  PairScreen({Key key}) : super(key: key);

  @override
  PairScreenState createState() => PairScreenState();
}

class PairScreenState extends State<PairScreen> {
  final _model = PairScreenModel();

  @override
  void initState() {
    _model.scanTapped();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _model.mainModel = Provider.of<MainModel>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PlatformScaffold(
        iosContentPadding: true,
        appBar: PlatformAppBar(
          title: Text("Scan"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => _model,
          child: Consumer<PairScreenModel>(
            builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child:
                          Text("Scan for Philips TVs on your local network."),
                    ),
                    model.state.when(loading: (() {
                      return Center(
                        child: Column(
                          children: [
                            MyPlatformCircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text(
                              "Scanning...",
                            ),
                          ],
                        ),
                      );
                    }), tvs: ((tvs) {
                      if (tvs.isEmpty) {
                        return Center(
                          child: PlatformButton(
                            child: Text("re-scan"),
                            onPressed: () {
                              _model.scanTapped();
                            },
                          ),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: tvs.length,
                            itemBuilder: (context, index) {
                              final tv = tvs[index];
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  splashColor: Colors.transparent,
                                ),
                                child: Material(
                                  child: Ink(
                                    color: Theme.of(context).accentColor,
                                    child: ListTile(
                                      title: Text(tv.friendlyName ?? "TV"),
                                      subtitle: Text(
                                        tv.name ?? "",
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      ),
                                      trailing: Text("${tv.ip}:${tv.port}"),
                                      onTap: () {
                                        model.tvSelected(tv).then((value) =>
                                            _showPairConfirmDialog());
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showPairConfirmDialog() {
    final controller = TextEditingController();
    final textField = PlatformTextField(
        controller: controller, keyboardType: TextInputType.number);

    final dialog = PlatformAlertDialog(
      title: Text("Enter PIN"),
      content: textField,
      actions: <Widget>[
        PlatformDialogAction(
          child: Text("OK"),
          onPressed: () {
            final pin = textField.controller.text;
            print("pin $pin");
            Navigator.pop(context);

            _model.confirmPair(pin);
          },
        )
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
