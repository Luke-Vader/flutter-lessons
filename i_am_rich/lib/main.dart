import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.yellow[100],
          appBar: new AppBar(
            title: Text("I Am Poor"),
            backgroundColor: Colors.yellow[600],
          ),
          body: Center(
            child: Image(
                image: AssetImage('images/coal.png'),
            ),
          ),
        ),
      ),
    );
