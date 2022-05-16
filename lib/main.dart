// ignore_for_file: deprecated_member_use


import 'package:daily_meals/screens/categories_meals_screen.dart';
import 'package:daily_meals/screens/categories_screen.dart';
import 'package:daily_meals/screens/meal_details_screen.dart';
import 'package:daily_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      //  canvasColor: const Color.fromARGB(150, 200, 80, 200),
    ),
    // ignore: prefer_const_constructors
    routes: {
      "/":(context)=>const TabsScreen(),
      "/categories_meals_screen":(context) => CategoriesMealsScreen(),
      MealDetails.routename:(context) => const MealDetails(),
    },
  ));
}
