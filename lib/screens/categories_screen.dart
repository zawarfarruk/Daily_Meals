// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:daily_meals/widgets/category_item.dart';
import 'package:daily_meals/dummy_data.dart';
import 'package:flutter/material.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("DeliMeals"),
      ),
      body: GridView(
        padding:const EdgeInsets.all(15),
        children: Dummy_Categories.map((catData) => CategoryItem(catData.id,catData.color,catData.title)).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio:1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    ); 
  }
}
