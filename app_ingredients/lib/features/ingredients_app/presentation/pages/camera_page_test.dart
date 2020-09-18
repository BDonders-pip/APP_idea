
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestCameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test page"),
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
              onPressed: () {},
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
}