import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagonal/diagonal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            child: Container(
              child: Align(
                alignment: Alignment(-0.6, -0.4),
                child: Text(
                  "APP",
                  style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                      inherit: false,
                      fontFamily: "Arial Rounded MT Bold"
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              color: Color(0xff085df4),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Diagonal(
              position: Position.TOP_RIGHT,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                color: Color(0xff5d83d8),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: OutlineButton(
              onPressed: (){},
              child: Text(
                "SCANEAR",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 5,
              ),
              padding: EdgeInsets.all(15)
            ),
          )
        ]
    );
  }
}
// Especificar las reglas de los widgets para que siga las resoluciones, nunca números fijos

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
