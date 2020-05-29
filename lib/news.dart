import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'news-info.dart';


class News extends StatelessWidget{

  final String apiUrl = "http://bachelorproject.patrickgilstad.tk/api/newsrequest.php";

  Future<List<dynamic>> fetchProducts() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body)['news'];

  }

  String _title(dynamic news){
    return news['title'];

  }

  String _desc(dynamic news){
    return news['description'];
  }

  String _dateonly(dynamic news){
  DateTime tstamp = DateTime.parse(news['date_added']);
  return DateFormat.yMMMMd('en_US').format(tstamp);
  }

  String _imageurl(String name_ext) {
    return "http://bachelorproject.patrickgilstad.tk/helpers/displayimage.php?img=" + name_ext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: 
        Container(
          padding: MediaQuery.of(context).padding,
          child: 
          Column(
            children: <Widget>[
              Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                        'News',
                        style: TextStyle(fontSize: 38, color: Colors.grey[800], fontWeight: FontWeight.bold,),
                        ),
                  ),
              Expanded(
                child: fetch_news(),
              ),
            ],
          ),
      ),
    ),
    );
  }

  FutureBuilder<List<dynamic>> fetch_news() {
    return FutureBuilder<List<dynamic>>(
          future: fetchProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              isThreeLine: true,
                              contentPadding:EdgeInsets.all(15),
                              leading: Image.network(
                                _imageurl(snapshot.data[index]['icon']),
                                height: 40,
                                width: 65,
                              ),
                              title: Text(_title(snapshot.data[index]),
                              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 28),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, right: 5),
                                        child:Icon(MdiIcons.calendarClock, size: 14, color: Colors.grey[800])
                                    ),
                                    ),
                                    TextSpan(
                                      text: _dateonly(snapshot.data[index]),
                                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff555555))),
                                  ]
                              ),
                              ),

                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.arrowRightBoldCircleOutline, size: 18,),
                              ],
                            ),


                            onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsInfo(),
                                        settings: RouteSettings(
                                          arguments: snapshot.data[index],
                                        ),
                                      ),
                                    );
                                },

                            )
                          ],
                        ),
                      );
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        );
  }

}