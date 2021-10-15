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
  int _sliderVal = 1;

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
  Widget buildIngredientTextItem(BuildContext context, int index) {
    final ingredient = widget.recipe.ingredients[index];
    var calculatedIngredientQuantity = ingredient.quantity * _sliderVal;
    return Text(
        '$calculatedIngredientQuantity ${ingredient.measure} ${ingredient.name}');
  }

  Widget buildSlider(String calculatedServingsCountText) => Slider(
        min: 1,
        max: 10,
        label: calculatedServingsCountText,
        value: _sliderVal.toDouble(),
        onChanged: (newValue) {
          setState(() {
            _sliderVal = newValue.round();
          });
        },
        activeColor: Colors.green,
        inactiveColor: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    var calculatedServingsCountText =
        '${_sliderVal * widget.recipe.servings} servings';
    return buildScaffold(buildColumn([
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
        itemBuilder: buildIngredientTextItem,
      )),
      Text(calculatedServingsCountText),
      buildSlider(calculatedServingsCountText)
    ]));
  }
}
