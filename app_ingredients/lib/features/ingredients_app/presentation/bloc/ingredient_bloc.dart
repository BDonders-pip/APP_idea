import 'dart:async';

import 'package:app_ingredients/core/error/failures.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:app_ingredients/features/ingredients_app/domain/usecases/get_ingredient.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE_MESSAGE =
    "The components needs to be in an ingredients list";

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  final GetIngredient getIngredient;

  IngredientBloc({
    @required GetIngredient ingredient
  }): assert(ingredient != null),
      getIngredient = ingredient;

  @override
  IngredientState get initialState => Empty();

  @override
  Stream<IngredientState> mapEventToState(
      IngredientEvent event,
      ) async* {
    if (event is GetIngredientEvent) {
      final input = event.inputName;
      final failureOrIngredient = await getIngredient(Params(name: input));

      yield Loading();
      yield* _eitherLoadedOrErrorState(failureOrIngredient);
    }
  }

  Stream<IngredientState> _eitherLoadedOrErrorState(Either<Failure, Ingredient> failureOrIngredient) async* {
    yield failureOrIngredient.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (ingredient) => Loaded(ingredient: ingredient),
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
