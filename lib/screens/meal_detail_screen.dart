import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MetailDetailScreen extends StatelessWidget {
  static const routeName = '/meal/detail';
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text('${text}', style: Theme.of(context).textTheme.headline6));
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
        appBar: AppBar(title: Text("${selectedMeal.title}")),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Card(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              margin:EdgeInsets.all(10),
              elevation:5,
              child:Container(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(15),
                  child:Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )))),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]))),
                  itemCount: selectedMeal.ingredients.length,
                )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(context,
            ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${(index+1)}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
            ))
          ]),
        ));
  }
}
