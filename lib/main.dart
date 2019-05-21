import 'package:flutter/material.dart';
import 'package:bakul/page/MyHomePage.dart';
import 'package:bakul/page/PilihPage.dart';
import 'package:bakul/page/ProfilePage.dart';
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
      home: PilihPage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => MyHomePage(),
        '/ProfilePage': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
