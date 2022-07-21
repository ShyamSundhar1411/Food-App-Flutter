import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [
    {'page':CategoryScreen(),'title':Text("Categories")},
    {'page':FavortiesScreen(),'title':Text('Favorities')},
  ];
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
