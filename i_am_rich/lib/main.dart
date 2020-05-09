import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: new AppBar(
            title: Text("I Am Rich"),
            backgroundColor: Colors.red,
            centerTitle: true,
            elevation: 4,
          ),
        ),
      ),
    );
