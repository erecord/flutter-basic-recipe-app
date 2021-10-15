import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  Widget buildScaffold(Widget body) => Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.label),
        ),
        body: SafeArea(
          child: body,
        ),
      );
  Image buildRecipeImage(Recipe recipe) => Image(
        image: AssetImage(recipe.imageUrl),
      );
  Text buildRecipeLabel(Recipe recipe) =>
      Text(widget.recipe.label, style: const TextStyle(fontSize: 18));
  Widget buildColumn(List<Widget> children) => Column(
        children: children,
      );
  Widget buildIngredientsList(BuildContext context, int index) {
    final ingredient = widget.recipe.ingredients[index];
    return Text(
        '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
  }

  @override
  Widget build(BuildContext context) => buildScaffold(buildColumn([
        SizedBox(
            height: 300,
            width: double.infinity,
            child: buildRecipeImage(widget.recipe)),
        const SizedBox(
          height: 4,
        ),
        buildRecipeLabel(widget.recipe),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(7),
          itemCount: widget.recipe.ingredients.length,
          itemBuilder: buildIngredientsList,
        ))
      ]));
}
