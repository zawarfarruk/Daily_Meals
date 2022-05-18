// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  const CategoriesMealsScreen(this.availableMeal);
  @override

  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
     final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
     categoryTitle = routeArgs['title'];
     displayedMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;}
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });

  }
//   const CategoriesMealsScreen(this.id,this.title);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            
              );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
