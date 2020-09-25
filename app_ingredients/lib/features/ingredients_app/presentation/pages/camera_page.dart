import 'file:///C:/Projects/APP_project/app_ingredients/lib/features/ingredients_app/presentation/widgets/camera_controls.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:app_ingredients/main.dart';

class CameraInit extends StatefulWidget {
  @override
  CameraInitState createState() => CameraInitState();
}

class CameraInitState extends State<CameraInit> {
  CameraController controller;

  @override
  void initState() {
    super.initState();

    // The controller basically is the control of an camera, in this case the back one [0]
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return Stack(
      children: <Widget>[
        CameraPreview(controller),
        // Top controls buttons
        CameraControls(),
      ],
    );
  }
}
