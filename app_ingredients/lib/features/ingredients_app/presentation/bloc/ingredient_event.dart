import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IngredientEvent extends Equatable {
  IngredientEvent([List props = const <dynamic>[]]) : super(props);
}

class GetIngredientEvent extends IngredientEvent {
  final String inputName;

  GetIngredientEvent(this.inputName): super([inputName]);
}