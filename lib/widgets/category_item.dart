// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
   
final String title;
 final Color color;
 final String id;
 const CategoryItem(this.id, this.color, this.title);
 void selectedScreen(BuildContext ctx){
   Navigator.of(ctx).pushNamed("/categories_meals_screen",
    arguments: {'id':id,'title':title});
   

 }
// final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectedScreen(context) ,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        // color: Colors.blue,
        decoration: BoxDecoration(
            gradient:LinearGradient(colors: [
           color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        
      ),
    );
  }
}