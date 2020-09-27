import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/main/main_model.dart';
import 'package:phimote/screens/device_discovery/pair_screen_model.dart';
import 'package:phimote/widgets/app_textfield.dart';
import 'package:phimote/widgets/loading_indicator.dart';
import 'package:phimote/widgets/title_button.dart';
import 'package:provider/provider.dart';

class PairScreen extends StatefulWidget {
  final Function() onPairFinished;

  PairScreen({
    Key key,
    @required this.onPairFinished,
  }) : super(key: key);

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
        body: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: Consumer<PairScreenModel>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text("Scan for Philips TVs on your local network."),
                ),
                model.state.when(loading: (() {
                  return buildLoading();
                }), tvs: ((tvs) {
                  if (tvs.isEmpty) {
                    return buildEmpty(model);
                  } else {
                    return Expanded(
                      child: buildList(model, tvs),
                    );
                  }
                }))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: Column(
        children: [
          LoadingIndicator(),
          SizedBox(height: 16),
          Text(
            "Scanning...",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Widget buildEmpty(PairScreenModel model) {
    return Center(
      child: TitleButton(
        title: "re-scan",
        onPressed: () {
          _model.scanTapped();
        },
      ),
    );
  }

  Widget buildList(PairScreenModel model, List<TV> tvs) {
    return ListView.builder(
      itemCount: tvs.length,
      itemBuilder: (context, index) {
        final tv = tvs[index];
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: Material(
            child: Ink(
              // color: Theme.of(context).accentColor,
              child: ListTile(
                title: Text(tv.friendlyName ?? "TV"),
                subtitle: Text(
                  tv.name ?? "",
                  style: DefaultTextStyle.of(context).style,
                ),
                trailing: Text("${tv.ip}:${tv.port}"),
                onTap: () {
                  onTvSelected(tv, model);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  onTvSelected(TV tv, PairScreenModel model) async {
    await model.tvSelected(tv);

    showPairConfirmDialog();
  }

  void showPairConfirmDialog() {
    final controller = TextEditingController();
    final textField = AppTextField(
      controller: controller,
      keyboardType: TextInputType.number,
    );

    final dialog = PlatformAlertDialog(
      title: Text("Enter PIN"),
      content: textField,
      actions: <Widget>[
        PlatformDialogAction(
          child: Text(
            "OK",
            style: Theme.of(context)
                .accentTextTheme
                .button
                .copyWith(color: AppColors.accentColor),
          ),
          onPressed: () {
            final pin = textField.controller.text;
            onPinEntered(pin);
          },
        )
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  onPinEntered(String pin) {
    _model.confirmPair(pin);

    widget.onPairFinished();
  }
}
