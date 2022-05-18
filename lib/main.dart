// ignore_for_file: deprecated_member_use, empty_statements, unused_element


import 'package:daily_meals/dummy_data.dart';
import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/screens/categories_meals_screen.dart';
import 'package:daily_meals/screens/filters_screen.dart';
import 'package:daily_meals/screens/meal_details_screen.dart';
import 'package:daily_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  Map<String,bool> _filters={
"gluten":false,
"lactose":false,
"vegan":false,
"vegetarian":false
};
List<Meal> _availableMeals=DUMMY_MEALS;
final List<Meal> _favouriteMeals=[];
void _setFilters(Map<String,bool>filtersData){
setState(() {
  _filters=filtersData;
  
  _availableMeals=DUMMY_MEALS.where((meal) {
    if(_filters["gluten"] && !meal.isGlutenFree)
    {
      return false;
    };
    if(_filters["lactose"] && !meal.isGlutenFree)
    {
      return false;
    };
    if(_filters["vegan"] && !meal.isVegan)
    {
      return false;
    };
    if(_filters["vegetarian"] && !meal.isVegetarian)
    {
      return false;
    }
    return true;
  }).toList();
});
}
void _toggleFavourite(String mealId){
  final existingIndex=_favouriteMeals.indexWhere((meal) => meal.id==mealId);
  if(existingIndex>=0)
  {
    setState(() {
      _favouriteMeals.removeAt(existingIndex);
    });
  }else
  {
    setState(() {
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
    });
  }
 
}
  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      //  canvasColor: const Color.fromARGB(150, 200, 80, 200),
    ),
    // ignore: prefer_const_constructors
    routes: {
      "/":(context)=> TabsScreen(_favouriteMeals),
      "/categories_meals_screen":(context) => CategoriesMealsScreen(_availableMeals),
      MealDetails.routename:(context) =>  MealDetails(_toggleFavourite, _isFavourite ),
      FiltersScreen.routename:(context) => FiltersScreen(_filters,_setFilters),
    },
  );
  }
}


