import 'package:flutter/material.dart';
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Padding buildPadding(Widget child) =>
    Padding(key: UniqueKey(), child: child, padding: const EdgeInsets.all(16));

Column buildColumn(Recipe recipe) {
  var children = [
    Image(image: AssetImage(recipe.imageUrl)),
    const SizedBox(
      height: 13,
    ),
    Text(
      recipe.label,
      style: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.w700, fontFamily: 'Palatino'),
    )
  ];
  return Column(
    children: children,
  );
}

Card buildCard(Padding padding) => Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: padding,
    );

Widget buildRecipeCard(Recipe recipe) =>
    buildCard(buildPadding(buildColumn(recipe)));

GestureDetector buildGestureDetector(
        BuildContext context, Widget child, Widget onTapContent) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => onTapContent));
      },
      child: child,
    );

Widget buildRecipeCards(BuildContext context, int index) {
  var recipe = Recipe.samples[index];
  return buildGestureDetector(
      context, buildRecipeCard(recipe), buildOnTapContent(recipe));
}

Widget buildOnTapContent(Recipe recipe) => RecipeDetail(recipe: recipe);

class _MyHomePageState extends State<MyHomePage> {
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
