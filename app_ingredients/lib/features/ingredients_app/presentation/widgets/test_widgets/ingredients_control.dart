import 'package:app_ingredients/features/ingredients_app/presentation/bloc/ingredient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class IngredientControls extends StatefulWidget {
  const IngredientControls({
    Key key,
  }) : super(key: key);

  @override
  _IngredientControlsState createState() => _IngredientControlsState();
}

class _IngredientControlsState extends State<IngredientControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget> [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Input a text",
        ),
        onChanged: (value) {
          inputStr = value;
        },
        onSubmitted: (value) => submitIngredientName(context, value),
      ),
      SizedBox(height: 10),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("Search a ingredient"),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () => submitIngredientName(context, inputStr),
            ),
          ),
          SizedBox(width: 10),
        ],
      )
    ],
    );
  }

  submitIngredientName (BuildContext context, String inputStr) {
    controller.clear();
    final ingredientCubit = context.bloc<IngredientCubit>();
    ingredientCubit.getIngredient(inputStr);
  }
}
