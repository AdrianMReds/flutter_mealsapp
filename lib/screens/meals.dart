import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MealDetailScreen(
                  meal: meal,
                  onToggleFavorite: onToggleFavorite,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: () {
                _selectMeal(context, meals[index]);
              },
            ));
    if (meals.isEmpty) {
      content = const Center(
        child: Text(
          'Uh oh... Nothing here!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
