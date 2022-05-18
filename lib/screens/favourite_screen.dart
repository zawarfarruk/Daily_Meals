// ignore_for_file: use_key_in_widget_constructors

import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen(this.favouriteMeals);
final List<Meal> favouriteMeals;
  @override
  Widget build(BuildContext context) {
   if(favouriteMeals.isEmpty)
   {
  return const Center(
    child:Text("You Have No Favourites Yet "),
  )  ; 
  }
  else{
    return ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability:favouriteMeals[index].affordability,
            
              );
        }
          ),
        itemCount: favouriteMeals.length,
      );
  }
  }
}