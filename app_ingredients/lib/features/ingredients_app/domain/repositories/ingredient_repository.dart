import 'package:app_ingredients/core/error/failures.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:dartz/dartz.dart';

abstract class IngredientRepository {
  Future<Either<Failure, Ingredient>> getIngredient(String name);
}