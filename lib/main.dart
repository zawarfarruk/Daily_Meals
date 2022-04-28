// ignore_for_file: deprecated_member_use

import 'package:daily_meals/categories_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
       canvasColor: const Color.fromARGB(200, 250, 180, 1),
    ),
    // ignore: prefer_const_constructors
    home: CatergoriesScreen(),
  ));
}
