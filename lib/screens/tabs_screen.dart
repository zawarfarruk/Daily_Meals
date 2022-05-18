// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:daily_meals/screens/categories_screen.dart';
import 'package:daily_meals/widgets/main_drawer.dart';
import '../models/meal.dart';
import './favourite_screen.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatefulWidget {
   const TabsScreen(this.favouriteMeals);
  final List<Meal> favouriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  
 
  int _selectedPageIndex=0;
    List<Map<String, Object>> _pages=[];
  @override
  void initState() {
     _pages = [
      {"Page": const CatergoriesScreen(), "title": "Categories"},
      {
        "Page":  FavouriteScreen(widget.favouriteMeals),
        "title": "Favourite Item"
      }
    ];
    super.initState();
  }
  void _selectedPages(int index){
      setState(() {
        _selectedPageIndex=index;
      });

  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]["title"]),
           ),
           drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]["Page"],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap:_selectedPages ,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
           unselectedItemColor: Colors.white,
           currentIndex: _selectedPageIndex,
          items: [
            // ignore: prefer_const_constructors
           const BottomNavigationBarItem(
              icon:  Icon(Icons.category),
              label:"category",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label:"Favourite",
            )
          ],
          
          
        ),
      
    );
  }
}