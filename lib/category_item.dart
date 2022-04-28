// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem( this.color,this.title);
final String title;
 final Color color;
// final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      
    );
  }
}