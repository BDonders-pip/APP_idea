import 'package:app_ingredients/features/ingredients_app/presentation/pages/camera_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CameraTestPage extends StatefulWidget {
  @override
  _CameraTestPageState createState() => _CameraTestPageState();
}

class _CameraTestPageState extends State<CameraTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera test page"),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue.shade300,
        width: 300,
        height: 300,
        child: Center(
            child: OutlineButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CameraInit()
                  ),
                );
              },
              child: Text(
                "Abrir camara",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              borderSide: BorderSide(
                color: Colors.white,
                width: 3,
              ),
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            )
        ),
      ),
    );
  }

  void cameraInit (BuildContext context, List<CameraDescription> cameras) {

  }
}