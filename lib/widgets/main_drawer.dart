import 'package:daily_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
        
          Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking UP!",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed("/");
          }),
          const SizedBox(height: 20,),
          buildListTile("Filters", Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routename);
          })
        ],
      ),
    );
  }
}
