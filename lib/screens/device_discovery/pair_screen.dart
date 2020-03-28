import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/main_model.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen_model.dart';
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
      child: Scaffold(
        appBar: AppBar(
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
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child:
                          Text("Scan for Philips TVs on your local network."),
                    ),
                    if (model.isScanning)
                      Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text("Scanning..."),
                          ],
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.tvs.length,
                          itemBuilder: (context, index) {
                            final tv = model.tvs[index];
                            return ListTile(
                              title: Text(tv.friendlyName ?? "TV"),
                              subtitle: Text(
                                tv.name ?? "",
                                style: DefaultTextStyle.of(context).style,
                              ),
                              trailing: Text("${tv.ip}:${tv.port}"),
                              onTap: () {
                                model
                                    .tvSelected(tv)
                                    .then((value) => _showPairConfirmDialog());
                              },
                            );
                          },
                        ),
                      ),
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
    final textField = CupertinoTextField(
        controller: controller, keyboardType: TextInputType.number);

    final dialog = CupertinoAlertDialog(
      title: Text("Enter PIN"),
      content: textField,
      actions: <Widget>[
        CupertinoDialogAction(
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

    showCupertinoDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
