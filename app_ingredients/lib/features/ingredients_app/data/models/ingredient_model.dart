import 'package:meta/meta.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  IngredientModel({
    @required String code,
    @required String name,
    @required String toxicity,
    @required String description,
    @required String uses,
    @required String secondaryEffects,
  }) : super(code: code, name: name, toxicity: toxicity, description: description, uses: uses, secondaryEffects: secondaryEffects);

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(code: json["code"], name: json["name"], toxicity: json["toxicity"], description: json["description"], uses: json["uses"], secondaryEffects: json["secondary_effects"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
      "toxicity": toxicity,
      "description": description,
      "uses": uses,
      "secondary_effects": secondaryEffects
    };
  }
}
