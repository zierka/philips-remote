import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/logic/scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<String> tvIPs = [];

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
                    tvIPs = null;
                  });

                  Scanner.scan().then((devices) {
                    print("devices $devices");
                    setState(() {
                      tvIPs = devices;
                    });
                  });
                },
              ),
            ),
            Text("TVs found:"),
            if (tvIPs == null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Scanning..."),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: tvIPs.length,
                  itemBuilder: (context, index) {
                    final item = tvIPs[index];
                    return ListTile(title: Text(item));
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
