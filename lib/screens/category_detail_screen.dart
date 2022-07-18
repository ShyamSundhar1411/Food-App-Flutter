import 'package:flutter/material.dart';
import '../widgets/mealDisplayWidget.dart';
import '../data/dummy_data.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/categorydetails';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text("${categoryTitle}")),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealDisplayWidget(categoryMeals[index]);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
