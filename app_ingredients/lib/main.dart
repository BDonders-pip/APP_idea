import 'package:app_ingredients/features/ingredients_app/presentation/bloc/ingredient_cubit.dart';
import 'package:app_ingredients/features/ingredients_app/presentation/pages/camera_page_test.dart';
import 'package:app_ingredients/features/ingredients_app/presentation/pages/repository_page_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/ingredients_app/domain/usecases/get_ingredient.dart';
import 'package:app_ingredients/injection_container.dart' as di;

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras(); // See if this statement trigger the camera permission
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App trailer",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: BlocProvider(
          create: (context) => IngredientCubit(GetIngredient(di.sl())),
          child: CameraTestPage(),
      ),
    );
  }
}
