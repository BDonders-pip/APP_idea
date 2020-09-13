import 'dart:convert';

import 'package:app_ingredients/core/error/exceptions.dart';
import 'package:app_ingredients/features/ingredients_app/data/models/ingredient_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IngredientLocalDataSource {
  /// Gets the cached [IngredientModel] wich was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<IngredientModel> getLastIngredient();
  Future<void> cacheIngredient(IngredientModel ingredientToCache);
}

const CACHED_INGREDIENT = "CACHED_INGREDIENT";

class IngredientLocalDataSourceImpl implements IngredientLocalDataSource {
  final SharedPreferences sharedPreferences;

  IngredientLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<IngredientModel> getLastIngredient() {
    final jsonString = sharedPreferences.getString(CACHED_INGREDIENT);

    if (jsonString != null) {
      return Future.value(IngredientModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheIngredient(IngredientModel ingredientToCache) {
    return sharedPreferences.setString(
        CACHED_INGREDIENT,
        json.encode(ingredientToCache.toJson()),
    );
  }
}
