import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Ingredient extends Equatable {
  final String code;
  final String name;
  final String toxicity;
  final String description;
  final String uses;
  final String secondaryEffects;
  final String otherNames;

  Ingredient({
    @required this.code,
    @required this.name,
    @required this.toxicity,
    @required this.description,
    @required this.uses,
    @required this.secondaryEffects,
    @required this.otherNames,
  }) : super([code, name, toxicity, description, uses, secondaryEffects, otherNames]);

}
