// ignore_for_file: use_key_in_widget_constructors

import 'package:daily_meals/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(this.toggleFunction,this.isMealFavourite);
  static const routename = "/meal-details-screen";
  final Function toggleFunction;
  final Function isMealFavourite;
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

// ignore: missing_return
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, "Ingredients"),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(selectedMeal.ingredients[index])),
                        ),
                    itemCount: selectedMeal.ingredients.length),
              ),
              buildSectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("#${(index + 1)}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    )),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isMealFavourite(mealId)?Icons.star:Icons.star_border
            ),
          onPressed:(){toggleFunction(mealId);},
          


        ),
        );
  }
}
