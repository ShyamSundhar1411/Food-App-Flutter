import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mealListDisplayWidget.dart';
import '../models/meal.dart';

class FavortiesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavortiesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Container(child: Center(child: Text("You have no favorites")));
    }
    else{
      return ListView.builder(itemBuilder: (ctx,index){
        return MealDisplayWidget(favorites[index]);
      },itemCount: favorites.length,);
    }
  }
}
