import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Youtube VS Tiktok",
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(),
      ),
    );
  }
}
