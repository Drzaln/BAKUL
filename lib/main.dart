import 'package:flutter/material.dart';
import 'package:tour/page/MyHomePage.dart';
//import 'package:tour/page/PilihPage.dart';
import 'package:tour/page/ProfilePage.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas RPL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => MyHomePage(),
        '/ProfilePage': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
