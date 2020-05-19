import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
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
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 32.0),
              height: 54.0,
              child: LiquidLinearProgressIndicator(
                value: tik/(yt+tik),
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
                        tik++;
                        print("Youtube = " + tik.toString());
                      });
                    },
                    child: Container(
                      child: Image.asset("images/tiktok.png"),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        yt++;
                        print("Youtube = " + yt.toString());
                      });
                    },
                    child: Container(
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
