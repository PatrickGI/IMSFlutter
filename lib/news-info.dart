import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class NewsInfo extends StatelessWidget {

String _imageurl(String path) {
    return "http://bachelorproject.patrickgilstad.tk/helpers/displayimage.php?img=" + path;
  } 

  String _datetime(dynamic news){
  DateTime tstamp = DateTime.parse(news['date_added']);
  return DateFormat('EEEE, MMMM d y - K.ma').format(tstamp);
  }

  @override
  Widget build(BuildContext context) {
    final Map newsData = ModalRoute.of(context).settings.arguments;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: 
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border(
                      //bottom: BorderSide(width:8.0, color: Colors.pink,),
                    )
                  ),
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Text(
                    newsData['title'],
                    style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.bold, color: Colors.pink,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                  child: 

                  RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 5),
                                        child:Icon(MdiIcons.calendarClock, size: 14, color: Colors.grey[800])
                                    ),
                                    ),
                                    TextSpan(
                                      text: _datetime(newsData),
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800])),
                                  ]
                              ),
                              ),

                ),
              ],
      ),
    );


    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, right: 32,),
      child: Text(
        newsData['description'],
        softWrap: true,
      ),
    );

    return MaterialApp(
      theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
      body: SafeArea(
        child: 
        Container(
          padding: MediaQuery.of(context).padding,
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        IconButton(icon:Icon(Icons.arrow_back, size: 20),
                        onPressed:() => Navigator.pop(context, false),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            'Return to News',
                            style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.bold,),
                            ),
                        ),
                      ],
                  ),
              ),
              Expanded(
                child:
                  ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey[800], width: 5.0,),
                              bottom: BorderSide(color: Colors.grey[800], width: 5.0,),
                              ),
                          ),
                          child:
                            Center(
                            child: Image.network(
                              _imageurl(newsData['icon']), 
                              fit: BoxFit.cover,)
                          ),
                      ),
                          titleSection,
                          textSection,
                        ],
                  ),
                ),
            ],
    ),
        ),
      ),
      ),
    );
  }

}