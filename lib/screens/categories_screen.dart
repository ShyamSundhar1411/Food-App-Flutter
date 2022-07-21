import "package:flutter/material.dart";
import '../data/dummy_data.dart';
import '../widgets/categoryItemWidget.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding:const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (categoryData) =>
                CategoryItemWidget(categoryData.id,categoryData.title, categoryData.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
