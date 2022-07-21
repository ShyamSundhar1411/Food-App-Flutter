import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealDisplayWidget extends StatelessWidget {
  final Meal meal;
  final Function _removeItem;
  MealDisplayWidget(this.meal, this._removeItem);

  String get ComplexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get AffordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    void onTapShowDetail() {
      Navigator.of(context).pushNamed(MetailDetailScreen.routeName,
          arguments: {'id': meal.id}).then((value) {
        if (value != null) {
          _removeItem(value);
        }
      });
    }

    return InkWell(
      onTap: onTapShowDetail,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          meal.title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('${meal.duration} min'),
                      ]),
                      Row(children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('${ComplexityText}'),
                      ]),
                      Row(children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('${AffordabilityText}'),
                      ])
                    ],
                  ))
            ],
          )),
    );
  }
}
