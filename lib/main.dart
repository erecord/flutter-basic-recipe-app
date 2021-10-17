import 'package:flutter/material.dart';
import 'package:recipes/extensions.dart';
import 'package:recipes/recipe_detail.dart';
import 'recipe.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.grey, secondary: Colors.black)),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Column buildRecipeCardContent(Recipe recipe) {
    return Column(
      children: [
        Image(image: AssetImage(recipe.imageUrl)),
        const SizedBox(
          height: 13,
        ),
        Text(
          recipe.label,
          style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino'),
        )
      ],
    );
  }

  Card buildRecipeCard(Recipe recipe) => Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: buildRecipeCardContent(recipe)
            .withPadding(const EdgeInsets.all(16)),
      );

  Widget buildRecipeCards(BuildContext context, int index) {
    var recipe = Recipe.samples[index];
    return buildRecipeCard(recipe)
        .withOnTapOpenPageGesture(context, RecipeDetail(recipe: recipe));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: buildRecipeCards,
        )));
  }
}
