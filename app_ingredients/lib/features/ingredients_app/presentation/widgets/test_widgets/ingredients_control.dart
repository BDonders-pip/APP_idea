import 'package:app_ingredients/features/ingredients_app/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class IngredientControls extends StatefulWidget {
  const IngredientControls({
    Key key,
  }) : super(key: key);

  @override
  _IngredientControls createState() => _IngredientControls();
}

class _IngredientControls extends State<IngredientControls> {
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
        onSubmitted: (_) {
          dispatchIngredient();
        },
      ),
      SizedBox(height: 10),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("Search a ingredient"),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: dispatchIngredient,
            ),
          ),
          SizedBox(width: 10),
        ],
      )
    ],
    );
  }

  void dispatchIngredient() {
    controller.clear();
    BlocProvider.of<IngredientBloc>(context).dispatch(GetIngredientEvent(inputStr));
  }
}
