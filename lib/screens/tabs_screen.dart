// ignore_for_file: prefer_const_literals_to_create_immutables

import './categories_screen.dart'; 
import './favourite_screen.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen({ Key key }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DeliMeals"),
          bottom: const TabBar(
            tabs: [
               Tab(
                icon: Icon(Icons.category),
                text: "Category",

              ),
               Tab(
                icon: Icon(Icons.star),
                text: "Favourite",
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          CatergoriesScreen(),
         FavouriteScreen(),
        ]),
      ),
    );
  }
}