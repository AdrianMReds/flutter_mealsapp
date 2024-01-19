import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => Text(
              meals[index].title,
              style: TextStyle(color: Colors.white),
            ));
    if (meals.isEmpty) {
      content = const Center(
        child: Text(
          'Uh oh... Nothing here!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
