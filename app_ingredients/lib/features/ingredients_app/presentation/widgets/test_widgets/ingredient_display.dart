import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientDisplay extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientDisplay({
    Key key,
    @required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(ingredient.name,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  ingredient.description,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
