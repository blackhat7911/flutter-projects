import 'dart:convert';
import 'package:coronatracker/screens/webview.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NewsBodyContainer extends StatefulWidget {
  @override
  _NewsBodyContainerState createState() => _NewsBodyContainerState();
}

class _NewsBodyContainerState extends State<NewsBodyContainer> {

  final String url = "https://nepalcorona.info/api/v1/news";
  Map data;
  List newsData;

  void initState(){
    super.initState();
    fetchNews();
  }

  void dispose(){
    super.dispose();
  }

  Future fetchNews() async {
    var response = await http.get(url);
    data = json.decode(response.body);
    setState((){
      newsData = data["data"];
    });
  }  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: newsData == null ? 0 : newsData.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          newsData[index]["image_url"],
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "${newsData[index]['title']}",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,  
                          ),
                        ),
                        Text(
                          "${newsData[index]['summary']}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,  
                          ),
                        ),
                        Text(
                          "Source : ${newsData[index]['source']}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: ColorsValues.deathColor,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        FlatButton(
                          child: Text("See more"),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(newsData[index]["url"])));
                          },
                        ),

                      ],
                    )
                  ),
                ),
              );
            },
          );
  }
}