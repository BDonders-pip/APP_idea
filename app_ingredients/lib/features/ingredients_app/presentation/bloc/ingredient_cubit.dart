import 'package:app_ingredients/core/error/failures.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:app_ingredients/features/ingredients_app/domain/usecases/get_ingredient.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'ingredient_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE_MESSAGE =
    "The components needs to be in an ingredients list";

class IngredientCubit extends Cubit<IngredientState> {
  final GetIngredient _getIngredient;

  IngredientCubit(this._getIngredient) : super(IngredientInitial());

  Future<void> getIngredient(String ingredientName) async {
    emit(IngredientLoading());

    final failureOrIngredient = await _getIngredient(Params(name: ingredientName));
    emit(_eitherLoadedOrErrorState(failureOrIngredient));
  }

  _eitherLoadedOrErrorState(Either<Failure, Ingredient> failureOrIngredient,) {
    return failureOrIngredient.fold(
          (failure) => IngredientError(_mapFailureToMessage(failure)),
          (ingredient) => IngredientLoaded(ingredient),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch(failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }

}
