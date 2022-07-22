import 'package:flutter/material.dart';
import '../widgets/mealListDisplayWidget.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routeName = '/categorydetails';
  final List<Meal> availableMeals;
  CategoryDetailScreen(this.availableMeals);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere(
        (element) => element.id == mealId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${categoryTitle}")),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealDisplayWidget(displayedMeals[index], _removeMeal);
          }),
          itemCount: displayedMeals.length,
        ));
  }
}
