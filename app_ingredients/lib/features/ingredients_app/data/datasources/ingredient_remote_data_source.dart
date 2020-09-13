import 'dart:convert';

import 'package:app_ingredients/core/error/exceptions.dart';
import 'package:app_ingredients/features/ingredients_app/data/models/ingredient_model.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class IngredientRemoteDataSource {
  /// Calls the https://vps1.camiloh.com/foods/{name} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<Ingredient> getIngredient(name);
}

class IngredientRemoteDataSourceImpl implements IngredientRemoteDataSource {
  final http.Client client;

  IngredientRemoteDataSourceImpl({@required this.client});

  @override
  Future<Ingredient> getIngredient(name) => _getIngredientFromUrl("https://vps1.camiloh.com/foods/$name");

  Future<IngredientModel> _getIngredientFromUrl(String url) async {
    final response = await client.get(
        url,
        headers: {
          "Content_Type": "application/json",
        },
    );

    if (response.statusCode == 200) {
      return IngredientModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}