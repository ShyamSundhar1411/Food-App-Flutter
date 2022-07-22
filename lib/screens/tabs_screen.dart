import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favorites;
  TabScreen(this.favorites);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': Text("Categories")},
      {'page': FavortiesScreen(widget.favorites), 'title': Text('Favorities')},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: _pages[_selectedPageIndex]['title'],
          ),
          body: _pages[_selectedPageIndex]['page'],
          drawer: DrawerWidget(),
          bottomNavigationBar: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.black,
              selectedItemColor: Theme.of(context).accentColor,
              currentIndex: _selectedPageIndex,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category,
                    ),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.star,
                    ),
                    label: 'Favorities'),
              ]),
        ));
  }
}
