import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';


class HeathMapPage extends StatefulWidget {
  const HeathMapPage({Key key}):super(key:key);
  @override
  _HeathMapPageState createState() => _HeathMapPageState();
}

class _HeathMapPageState extends State<HeathMapPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
       // bottom: false,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.965,
                width: double.infinity,
                child: WebView(
                  initialUrl: "http://mapcakeboss.webcindario.com/",
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
              //Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
