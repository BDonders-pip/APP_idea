part of 'ingredient_cubit.dart';

@immutable
abstract class IngredientState {
  const IngredientState();
}

class IngredientInitial extends IngredientState {
  const IngredientInitial();
}

class IngredientLoading extends IngredientState {
  const IngredientLoading();
}

class IngredientLoaded extends IngredientState {
  final Ingredient ingredient;

  const IngredientLoaded(this.ingredient);

  // Overriding equality to avoid some of confusions in future
  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is IngredientLoaded && o.ingredient == ingredient;
  }

  @override
  int get hashCode => ingredient.hashCode;
}

class IngredientError extends IngredientState {
  final String message;

  const IngredientError(this.message);

  // Overriding equality to avoid some of confusions in future
  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is IngredientError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
