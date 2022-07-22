import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function updateState;
  final Map<String, bool> currentFilters;
  static const routeName = '/filter';
  FilterScreen(this.updateState, this.currentFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluttenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _Lactosefree = false;
  Widget SwitchBuilder(BuildContext context, String toDisplay, String subtitle,
      bool controlVariable, Function updateValue) {
    return SwitchListTile(
        title: Text("${toDisplay}"),
        subtitle: Text("${subtitle}"),
        value: controlVariable,
        onChanged: updateValue);
  }

  @override
  void initState() {
    _gluttenFree = widget.currentFilters['glutten'];
    _Lactosefree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'glutten': _gluttenFree,
                    'lactose': _Lactosefree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.updateState(selectedFilters);
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: DrawerWidget(),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.headline6,
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                SwitchBuilder(
                    context,
                    'Glutten Free',
                    "Includes Only Glutten Free Meal",
                    _gluttenFree, (newValue) {
                  setState(() {
                    _gluttenFree = newValue;
                  });
                }),
                SwitchBuilder(
                    context, 'Vegan', "Includes Only Vegan Food", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                SwitchBuilder(context, 'Vegetarian',
                    "Includes Only Vegetarian Food", _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                SwitchBuilder(context, 'Lactose Free',
                    "Includes Lactose Free Food", _Lactosefree, (newValue) {
                  setState(() {
                    _Lactosefree = newValue;
                  });
                }),
              ],
            ))
          ],
        )));
  }
}
