// ignore_for_file: deprecated_member_use

import 'package:daily_meals/categories_meals_screen.dart';
import 'package:daily_meals/categories_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      //  canvasColor: const Color.fromARGB(150, 200, 80, 200),
    ),
    // ignore: prefer_const_constructors
    home: CatergoriesScreen(),
    routes: {
      "/categories_meals_screen":((context) => CategoriesMealsScreen()),
    },
  ));
}
