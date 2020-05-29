import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Contact extends StatelessWidget {
  BorderRadius borderRadItem = BorderRadius.circular(4.0);
  static Color accentCol = Colors.pink;
  double iconSize = 24;
  double elevation_val = 0;
  TextStyle textstyle = TextStyle(color: accentCol, fontWeight: FontWeight.w500, fontSize: 18);
  Color tilebackground = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:40),
              child: Image(
              image: AssetImage('images/companylogo.png'),
              width: 350.0,
              height: 150.0,
            )
            ),
            Divider(
              color: Colors.pink[500],
              thickness: 4,
              indent: 40.0,
              endIndent: 40.0,
            ),
            SizedBox(
              height: 5.0,
            ),
             Visibility(
              child: Card(
                elevation: elevation_val,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadItem,
                ),
                color: tilebackground,
                child: ListTile(
                  leading: Icon(MdiIcons.cursorDefaultClick, color: accentCol, size: iconSize,),
                  title: Text(
                    'SuperiorRacking.ie',
                    style: textstyle,
                  ),
                  onTap: () {
                    launch('https://superiorracking.ie/');
                  },
                ),
              ),
            ),
                  Visibility(
              child: Card(
                elevation: elevation_val,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadItem,
                ),
                color: tilebackground,
                child: ListTile(
                  leading: Icon(MdiIcons.phoneOutline, color: accentCol, size: iconSize,),
                  title: Text(
                    'Call: (01) 8353889',
                    style: textstyle,
                  ),
                  onTap: () {
                    launch("tel://+353871904703");
                  },
                ),
              ),
            ),
            Card(
                elevation: elevation_val,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 40.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: borderRadItem,
              ),
              color: tilebackground,
              child: ListTile(
                leading: Icon(MdiIcons.email, color: accentCol, size: iconSize,),
                title: Text(
                  'Email Us',
                  style: textstyle,
                ),
                onTap: () {
                  launch('mailto:' + 'patpat@live.no');
                },
              ),
            ),
                         Card(
                elevation: elevation_val,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadItem,
                ),
                color: tilebackground,
                child: ListTile(
                  leading: Icon(MdiIcons.facebookMessenger, color: accentCol, size: iconSize,),
                  title: Text(
                    'Messenger Chat',
                    style: textstyle,
                  ),
                  onTap: () {
                    launch('http://m.me/superiorracking');
                  },
                ),
              ),
             Card(
                elevation: elevation_val,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadItem,
                ),
                color: tilebackground,
                child: ListTile(
                  leading: Icon(MdiIcons.facebook, color: accentCol, size: iconSize,),
                  title: Text(
                    'Like us on Facebook',
                    style: textstyle,
                  ),
                  onTap: () {
                    launch('https://www.facebook.com/superiorracking/');
                  },
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}