import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class ProductInfo extends StatelessWidget {
  static Color gettheme(String conditionCategory) {
    Color bg;
    switch (conditionCategory) {
      case '1': {
          bg = Color(0xff89E5B7);
      } 
      break;

      case '2': {
          bg = Color(0xffC3FFE0);
      }
      break;

      case '3': {
          bg = Color(0xffFFFF80);
      }
      break;

      case '4': {
          bg = Color(0xffFFCC99);
      }
      break;

      case '5': {
          bg = Color(0xffFF9999);
      }
      break;

      default: {
          bg = Colors.grey[400];
      }
      break;
    }
    return bg;
  }

String _imageurl(String path) {
    return "http://bachelorproject.patrickgilstad.tk/helpers/displayimage.php?img=" + path;
  } 

    static Container _conditionBox(String conditionCategory) {
    Color bg;
    EdgeInsets padding = const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15,);
    String boxtext;

    switch (conditionCategory) {
      case '1': {
          bg = Color(0xff89E5B7);
          boxtext ='BRAND NEW';
      } 
      break;

      case '2': {
          bg = Color(0xffC3FFE0);
          boxtext ='USED - LIKE NEW';
      }
      break;

      case '3': {
          bg = Color(0xffFFFF80);
          boxtext ='USED - VERY GOOD';
      }
      break;

      case '4': {
          bg = Color(0xffFFCC99);
          boxtext = 'USED - GOOD';
      }
      break;

      case '5': {
          bg = Color(0xffFF9999);
          boxtext = 'USED - OK';
      }
      break;

      default: {
          bg = Colors.grey[400];
          boxtext = 'OTHER';
      }
      break;
    }

    TextStyle boxtext_style = TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 14);

    return Container(
                decoration: BoxDecoration(
                  border: Border(
                    //bottom: BorderSide(width: 8.0, color: Colors.grey[800]),
                  ),
                shape: BoxShape.rectangle,
                color: bg,
                ),
                padding: padding,
                child: Text(boxtext, style: boxtext_style,),
      );

  }
Color theme_color;
TextStyle subinfo_style = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey[800],);
Color icon_color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    final Map productData = ModalRoute.of(context).settings.arguments;
    theme_color = gettheme(productData['condition_category']);
    final List<String> images = productData['filepath'].split(';');

    Widget titleSection = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      //bottom: BorderSide(color: Colors.grey[800], width: 8.0,)
                      ),
                    color: Colors.grey[800],
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15,),
                  child: Text(
                    productData['productname'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme_color,
                      fontSize: 32.0,
                    ),
                  ),
                ),

                _conditionBox(productData['condition_category']),

                Padding(padding: EdgeInsets.only(bottom: 15.0,),),

                                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child:Icon(MdiIcons.stateMachine, size: 20, color: icon_color)
                      ),
                      ),
                      TextSpan(
                        text: productData['condition_desc'],
                        style: subinfo_style),
                    ]
                ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 5.0,),),

                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child:Icon(MdiIcons.tapeMeasure, size: 20, color: icon_color,)
                      ),
                      ),
                      TextSpan(
                        text: productData['unit_desc'],
                        style: subinfo_style),
                    ]
                ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 5.0,),),

                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child:Icon(MdiIcons.cash, size: 20, color: icon_color),
                      ),
                      ),
                      TextSpan(
                        text: '€' + productData['unit_price'] + ' per unit',
                        style: subinfo_style),
                    ]
                ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 5.0,),),

                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child:Icon(MdiIcons.cartArrowDown, size: 20, color: icon_color)
                      ),
                      ),
                      TextSpan(
                        text: productData['unit_quantity'] + ' in stock',
                        style: subinfo_style),
                    ]
                ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 15.0,),),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border(
                      //bottom: BorderSide(color: theme_color, width: 8.0,),
                    ),
                  ),
                  child: RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child:Icon(MdiIcons.signText, size: 20, color: theme_color,)
                      ),
                      ),
                      TextSpan(
                        text: 'Description:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: theme_color,),
                ),
                    ]
                ),
                ),
            ),

                Padding(padding: EdgeInsets.only(bottom: 8.0,),),

                Container(
                  decoration: BoxDecoration(
                    //border: Border(top: BorderSide(color: theme_color, width: 6.0,)),
                  ),
                  padding: const EdgeInsets.only(bottom: 0, top: 0),
                  child: Text(
                    productData['productdesc'],
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
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
        top: false,
        child: 
        Container(
          padding: MediaQuery.of(context).padding,
          child: 
          Column(
            children: <Widget>[
              Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                            'Return to Products',
                            style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.bold,),
                            ),
                        ),

                      ],
                  ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    CarouselSlider(
                  options: CarouselOptions(),
                  items: images.map((item) => Container(
                    decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: theme_color, width: 8.0,),
                              bottom: BorderSide(color: theme_color, width: 8.0,),
                              ),
                          ),
                    child: Center(
                      child: Image.network(_imageurl(item), fit: BoxFit.cover, width: 600, height: 240)
                    ),
                      )).toList(),
                    ),
                        titleSection,
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

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}