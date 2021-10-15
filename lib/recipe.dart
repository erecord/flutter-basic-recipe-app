import 'package:recipes/recipie_service.dart';

class Recipe {
  String label;
  String imageUrl;
  // TODO: Add servings and ingredients

  Recipe(this.label, this.imageUrl);
  List<Recipe> samples = RecipeService.findAll();
}

// TODO: Add Ingredient here
