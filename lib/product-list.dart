import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:practice/product-info.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class ProductList extends StatefulWidget {

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList>{

  static final String apiUrl = "http://bachelorproject.patrickgilstad.tk/api/productrequest.php";

  static TextStyle subinfo_style = TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.grey[800],);
  static Color icon_color = Colors.grey[800];
  static double icon_size = 16;
  static EdgeInsets inter_icon_pad = EdgeInsets.symmetric(horizontal: 3);

  static Future<List<dynamic>> fetchProducts() async {
    var result = await http.get(apiUrl);
    List<dynamic> jsondata = json.decode(result.body)['product'];
    jsondata.sort((a, b) => a['productname'].compareTo(b['productname']));
    //else jsondata.sort((a, b) => b['date_added'].compareTo(a['date_added']));
    return jsondata;
  }

  static Container _conditionBox(String conditionCategory) {
    Color bg;
    EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10, vertical: 4);
    String boxtext;
    TextStyle boxtext_style = TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 12);

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

    return Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: bg,
                ),
                padding: padding,
                child: Text(boxtext, style: boxtext_style,),
      );

  }
  static String _conditionCategory(dynamic product) {
    return product['condition_category'];
  }

  static String _name(dynamic product){
    return product['productname'];
  }
    static String _quantity(dynamic product){
    return product['unit_quantity'];
  }

  static String _desc(dynamic product){
    return product['unit_desc'];
  }

  static String _price(dynamic product){
    return product['unit_price'];
  }

  static String _imageurl(String name_ext) {
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
                        'Products',
                        style: TextStyle(fontSize: 38, color: Colors.grey[800], fontWeight: FontWeight.bold,),
                        ),
                  ),
              Expanded(
                child: produce_list(),
              ),
            ],
          ),
      ),
    ),
    );
  }

  static FutureBuilder<List<dynamic>> produce_list() {
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
                              contentPadding: EdgeInsets.all(8),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(_imageurl(snapshot.data[index]['filepath'].split(";")[0]))),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                child: Text(_name(snapshot.data[index]), style: TextStyle(fontSize: 20.0, color: Colors.pink, fontWeight: FontWeight.bold),),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 8),),
                                _conditionBox(_conditionCategory(snapshot.data[index])),
                                Padding(padding: EdgeInsets.only(bottom: 8),),
                                ]
                              ),
                              subtitle: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Container(
                                            padding: EdgeInsets.only(right: 2),
                                            child:Icon(MdiIcons.tapeMeasure, size: icon_size, color: icon_color),
                                        ),
                                        ),
                                        TextSpan(
                                          text: _desc(snapshot.data[index]),
                                          style: subinfo_style),
                                      ]
                                  ),
                                  ),
                                  Padding(padding: inter_icon_pad,),
                                  RichText(
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Container(
                                            padding: EdgeInsets.only(right: 2),
                                            child:Icon(MdiIcons.cartArrowDown, size: icon_size, color: icon_color),
                                        ),
                                        ),
                                        TextSpan(
                                          text: _quantity(snapshot.data[index]),
                                          style: subinfo_style),
                                      ]
                                  ),
                                  ),
                                  Padding(padding: inter_icon_pad,),
                                  RichText(
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Container(
                                            padding: EdgeInsets.only(right: 2),
                                            child:Icon(MdiIcons.cash, size: icon_size, color: icon_color),
                                        ),
                                        ),
                                        TextSpan(
                                          text: '€' + snapshot.data[index]['unit_price'] + "/u",
                                          style: subinfo_style),
                                      ]
                                  ),
                                  ),
                                ],
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
                                        builder: (context) => ProductInfo(),
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