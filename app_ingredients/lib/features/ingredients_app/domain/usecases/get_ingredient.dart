import 'package:app_ingredients/core/error/failures.dart';
import 'package:app_ingredients/core/usecases/usecase.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:app_ingredients/features/ingredients_app/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetIngredient implements UseCase<Ingredient, Params> {
  final IngredientRepository repository;

  // https://vps1.camiloh.com/foods/name/quillay

  GetIngredient(this.repository);

  @override
  Future<Either<Failure, Ingredient>> call(Params params) async {
    return await repository.getIngredient(params.name);
  }
}

class Params extends Equatable {
  final String name;
  Params({@required this.name}) : super([name]);
}
