import 'dart:convert';
import 'package:coronatracker/models/cases_model.dart';
import 'package:coronatracker/screens/home/case_reports.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BodyContainer extends StatefulWidget {
  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {

  final String url = "https://nepalcorona.info/api/v1/data/nepal";
  Future<Cases> _future;

  void initState(){
    super.initState();
    _future = fetchCases();
  }

  Future<Cases> fetchCases() async{
    final response = await http.get(
      //encoding url
      Uri.encodeFull(url),
      headers: {"Accept":"application/json"}
    );
    if (response.statusCode == 200){
      var results = Cases.fromJson(json.decode(response.body));
      return results;
    }else{
      print("Sorry");
    }
  } 

  
  @override
  Widget build(BuildContext context) {
    return Container(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Text("Nepal", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                    Padding(
                    padding: EdgeInsets.all(8.0),),
                    Expanded(child: CaseGridView(future: _future), flex: 2,),
                  
                    Text("Overall Stats", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                  
                    Expanded(child: OverallStats(future: _future,),),
                  ],
                ),
                ),
    );
  }
}

class CaseGridView extends StatelessWidget {
  const CaseGridView({
    Key key,
    @required Future<Cases> future,
  }) : _future = future, super(key: key);

  final Future<Cases> _future;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  color: ColorsValues.defaultColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: ColorsValues.defaultColor,
                            child: Image.asset(
                               "assets/icons/viruses.png",
                               color: ColorsValues.primaryColor,
                              ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0)
                          ),
                          Text(
                            "Total Tests",
                            style: TextStyle(
                              color: ColorsValues.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Center(
                            child: FutureBuilder<Cases>(
                              future: _future,
                              builder: (context, snapshot){
                                if (snapshot.hasData){
                                return Text(
                                snapshot.data.total,
                                style: TextStyle(
                                color: ColorsValues.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              );
                                } 
                                else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                  ),
                  ),
              ),
              ),
           ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  color: ColorsValues.defaultColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: ColorsValues.defaultColor,
                          child: Image.asset(
                           "assets/icons/viruses.png",
                           color: ColorsValues.redColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0)
                        ),
                        Text(
                          "Confirmed",
                          style: TextStyle(
                            color: ColorsValues.redColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Center(
                          child: FutureBuilder<Cases>(
                            future: _future,
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return Text(
                                snapshot.data.confirmed,
                                style: TextStyle(
                                color: ColorsValues.redColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                            ),
                          );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  color: ColorsValues.defaultColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: ColorsValues.defaultColor,
                          child: Image.asset(
                           "assets/icons/viruses.png",
                           color: ColorsValues.recoveredColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0)
                        ),
                        Text(
                          "Recovered",
                          style: TextStyle(
                            color: ColorsValues.recoveredColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                         Center(
                          child: FutureBuilder<Cases>(
                            future: _future,
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return Text(
                                snapshot.data.recovered,
                                style: TextStyle(
                                color: ColorsValues.recoveredColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                            ),
                          );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Container(
                  color: ColorsValues.defaultColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: ColorsValues.defaultColor,
                          child: Image.asset(
                           "assets/icons/viruses.png",
                           color: ColorsValues.deathColor
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0)
                        ),
                        Text(
                          "Deaths",
                          style: TextStyle(
                            color: ColorsValues.deathColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Center(
                          child: FutureBuilder<Cases>(
                            future: _future,
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return Text(
                                snapshot.data.death,
                                style: TextStyle(
                                color: ColorsValues.deathColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                            ),
                          );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
  }
}