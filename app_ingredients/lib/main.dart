import 'package:flutter/material.dart';
import 'package:diagonal/diagonal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App trailer",
      home: StartWidget(),

    );
  }
}

class StartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Diagonal(
            position: Position.BOTTOM_LEFT,
            clipHeight: 400,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 520,
              color: Color(0xff085df4),
            ),
          ),
          Text(
            "APP",
            style: TextStyle(fontFamily: "Arial"),
          ),
          Positioned(
            bottom: 0,
            child: Diagonal(
              position: Position.TOP_RIGHT,
              clipHeight: 400,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 565,
                color: Color(0xff5d83d8),
              ),
            ),
          ),
        ]
    );
  }
}