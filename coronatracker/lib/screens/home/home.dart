import 'dart:io';
import 'package:coronatracker/drawer/navdrawer.dart';
import 'package:coronatracker/screens/home/body_container.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: ColorsValues.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorsValues.primaryColor,
          ), 
          onPressed: (){
            _scaffoldkey.currentState.openDrawer();
          }
        ),
        title: Text(
          "CoronaTracker",
          style: TextStyle(
            color: ColorsValues.primaryColor
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: ColorsValues.primaryColor,),
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    child: FlatButton(
                      child: Text("Exit"),
                      onPressed: (){
                        exit(0);
                      },
                    ),
                  ),
                ];
              },
          ) 
        ]
      ),
      body: BodyContainer(), 
      drawer: NavDrawer(),
    );
  }
}