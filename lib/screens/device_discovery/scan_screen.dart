import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/tv.dart';
import 'package:philips_remote/services/device_discovery.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<TV> tvs = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Scan for Philips TVs on your local network"),
            Center(
              child: CupertinoButton(
                child: Text("Scan"),
                onPressed: () {
                  setState(() {
                    tvs = null;
                  });

                  DeviceDiscovery().getTVs().then((tvs) {
                    setState(() {
                      this.tvs = tvs;
                    });
                  });
                },
              ),
            ),
            Text("TVs found:"),
            if (tvs == null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Scanning..."),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: tvs.length,
                  itemBuilder: (context, index) {
                    final tv = tvs[index];
                    return ListTile(
                      title: Text(tv.friendlyName),
                      subtitle: Text(
                        tv.name,
                        style: DefaultTextStyle.of(context).style,
                      ),
                      trailing: Text("${tv.ip}:${tv.port}"),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
