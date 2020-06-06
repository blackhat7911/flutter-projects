import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {

  final String url = "https://www.who.int/health-topics/coronavirus#tab=tab_3";
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      key: _key,
      appBar: AppBar(
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Symptoms",
          style: TextStyle(
            color: ColorsValues.primaryColor
          ),
        ),
      )
    );
  }
}