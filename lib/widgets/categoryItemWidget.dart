import 'package:flutter/material.dart';
import '../screens/category_detail_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItemWidget(this.id, this.title, this.color);
  void onTapChangePage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryDetailScreen.routeName, arguments: {'id':this.id,'title':this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapChangePage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline6)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
