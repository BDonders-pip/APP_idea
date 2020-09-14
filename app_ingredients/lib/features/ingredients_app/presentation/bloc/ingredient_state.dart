import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IngredientState extends Equatable {
  IngredientState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends IngredientState {
  @override
  List<Object> get props => [];
}

class Loading extends IngredientState {}

class Loaded extends IngredientState {
  final Ingredient ingredient;

  Loaded({@required this.ingredient}): super([ingredient]);
}

class Error extends IngredientState {
  final String message;

  Error({@required this.message}): super([message]);
}
