import 'package:coronatracker/screens/news/news_body.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {

  final url;
  WebViewPage(this.url);

  @override
  _WebViewPageState createState() => _WebViewPageState(this.url);
}

class _WebViewPageState extends State<WebViewPage> {
  
  _WebViewPageState(this._url);
  var _url;
  final _key = UniqueKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
        key: _key,
        url: _url,
      ),
      )
    );
  }
}