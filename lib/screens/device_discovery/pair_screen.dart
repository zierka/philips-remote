import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/logic/models/tv.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/screens/root/root_model.dart';
import 'package:phimote/screens/device_discovery/pair_screen_model.dart';
import 'package:phimote/widgets/app_textfield.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/loading_indicator.dart';
import 'package:phimote/widgets/fixed_app_bar.dart';
import 'package:provider/provider.dart';

const _helpText = """
Check the following:

• TV is turned on and connected to your home WIFI network
• phone is connected to the same home WIFI network
""";

class PairScreen extends StatefulWidget {
  final Function() onPairFinished;

  PairScreen({
    Key? key,
    required this.onPairFinished,
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
    _model.rootModel = Provider.of<RootModel>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: FixedAppBar(
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
          return model.state.when(
            loading: (() {
              return buildLoading();
            }),
            tvs: ((tvs) {
              if (tvs.isEmpty) {
                return buildEmpty(model);
              } else {
                return buildList(model, tvs);
              }
            }),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(Paddings.x2),
              child: Text("Scanning for TVs on your local network."),
            ),
          ),
          SizedBox(height: Paddings.x1),
          LoadingIndicator(),
          SizedBox(height: Paddings.x2),
          Text(
            "Scanning...",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Widget buildEmpty(PairScreenModel model) {
    return Padding(
      padding: EdgeInsets.all(Paddings.x2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("No TVs found."),
          SizedBox(height: Paddings.x1),
          Center(
            child: ControlButton(
              child: Text(
                "re-scan",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Analytics.track("re-scan tap");

                _model.scanTapped();
              },
            ),
          ),
          SizedBox(height: Paddings.x4),
          Text(_helpText),
        ],
      ),
    );
  }

  Widget buildList(PairScreenModel model, List<TV> tvs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(Paddings.x2),
          child: Text("Found the following TVs:"),
        ),
        SizedBox(height: Paddings.x1),
        Expanded(
          child: ListView.builder(
            itemCount: tvs.length,
            itemBuilder: (context, index) {
              final tv = tvs[index];
              return Material(
                child: Ink(
                  child: ListTile(
                    title: Text(tv.friendlyName ?? "TV"),
                    subtitle: Text(
                      tv.name ?? "",
                      style: DefaultTextStyle.of(context).style,
                    ),
                    trailing: Text("${tv.ip}:${tv.port}"),
                    onTap: () => onTvSelected(tv, model),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  onTvSelected(TV tv, PairScreenModel model) async {
    Analytics.track("tv selected");

    await model.tvSelected(tv);

    showPairConfirmDialog();
  }

  void showPairConfirmDialog() {
    final controller = TextEditingController();
    final textField = AppTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      onSubmitted: onPinEntered,
    );

    final dialog = PlatformAlertDialog(
      title: Text("Enter PIN shown on TV\n"),
      content: textField,
      actions: <Widget>[
        PlatformDialogAction(
          child: Text(
            "Cancel",
            style: Theme.of(context).accentTextTheme.button?.copyWith(color: AppColors.accentColor),
          ),
          onPressed: () {
            Analytics.track("cancel pin dialog tap");
            Navigator.of(context).pop();
          },
        ),
        PlatformDialogAction(
          child: Text(
            "Connect",
            style: Theme.of(context).accentTextTheme.button?.copyWith(color: AppColors.accentColor),
          ),
          onPressed: () {
            final pin = textField.controller.text;
            onPinEntered(pin);
          },
        ),
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  onPinEntered(String pin) async {
    Analytics.track("pin entered");

    await _model.confirmPair(pin);

    widget.onPairFinished();
  }
}
