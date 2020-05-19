import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'BalsamiqSans'),
    debugShowCheckedModeBanner: false,
    home: VotePage(),
  ));
}

class VotePage extends StatefulWidget {
  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  int tik = 0;
  int yt = 0;

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase.instance
        .reference()
        .orderByKey()
        .equalTo("tiktok")
        .once()
        .then((DataSnapshot data) {
      setState(() {
        tik = data.value['tiktok'];
      });
    });

    FirebaseDatabase.instance
        .reference()
        .orderByKey()
        .equalTo("youtube")
        .once()
        .then((DataSnapshot data) {
      setState(() {
        yt = data.value['youtube'];
      });
    });

    return Scaffold(
      backgroundColor: Colors.orange[400],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  "Youtube vs Tiktok",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 32.0),
              height: 54.0,
              child: LiquidLinearProgressIndicator(
                value: tik / (yt + tik),
                valueColor: AlwaysStoppedAnimation(Colors.cyan[300]),
                backgroundColor: Colors.red[600],
                borderRadius: 12,
                direction: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Text(
                      tik.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 64,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      yt.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 64,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        FirebaseDatabase.instance
                            .reference()
                            .orderByKey()
                            .equalTo("tiktok")
                            .once()
                            .then((DataSnapshot data) {
                          setState(() {
                            tik = data.value['tiktok'];
                          });
                        });
                        tik++;
                        FirebaseDatabase.instance
                            .reference()
                            .update({'tiktok': tik});
                        print("Tiktok = " + tik.toString());
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      padding: EdgeInsets.all(24),
                      child: Image.asset("images/tiktok.png"),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        FirebaseDatabase.instance
                            .reference()
                            .orderByKey()
                            .equalTo("youtube")
                            .once()
                            .then((DataSnapshot data) {
                          setState(() {
                            yt = data.value['youtube'];
                          });
                        });
                        yt++;
                        FirebaseDatabase.instance
                            .reference()
                            .update({'youtube': yt});
                        print("Youtube = " + yt.toString());
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      padding: EdgeInsets.all(24),
                      child: Image.asset("images/youtube.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
