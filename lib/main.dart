
import 'package:flutter/material.dart';
import 'package:practice/contact.dart';
import 'package:practice/news.dart';
import 'package:practice/product-list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return MyAppState();
    }
}
class MyAppState extends State<MyApp> {
    int _selectedTab = 0;
    final _pageOptions = [
        ProductList(),
        News(),
        Contact(),
    ];
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white),
            )),
        home: Scaffold(        
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            currentIndex: _selectedTab,
            onTap: (int index) {
                setState(() {
                    _selectedTab = index;
                });
            },
            items: [
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.storeOutline),
                    activeIcon: Icon(MdiIcons.store),
                    title: Text('Products'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.newspaperVariantOutline),
                    activeIcon: Icon(MdiIcons.newspaperVariant),
                    title: Text('News'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.emailOutline),
                    activeIcon: Icon(MdiIcons.emailOpen),
                    title: Text('Contact'),
                ),
            ],
        ),
    ),
    );
}}