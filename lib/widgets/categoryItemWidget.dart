import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItemWidget(this.title,this.color);
  @override
  Widget build(BuildContext context){
      return Container(
        padding: const EdgeInsets.all(8),
        child: Text(title),
        decoration: BoxDecoration(gradient:
        LinearGradient(colors: [
          color.withOpacity(0.7),
          color
          ],
          begin:Alignment.topLeft,
          end:Alignment.bottomRight,
            ),
          borderRadius: BorderRadius.circular(5),
          ),
        );
  }
}
