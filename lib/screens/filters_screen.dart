// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
 
  static const routename = "/filters";
  final Function savefilters;
  final Map<String,bool> currentFilters;
  const FiltersScreen(this.currentFilters,this.savefilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan=false;
  bool _glutenFree=false;
  bool _vegetarin=false;
  bool _lactoseFree=false;
  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarin = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Filters"),
        actions: [IconButton(
          onPressed:(){
            final selectedFilters= {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarin,
                };
            widget.savefilters(selectedFilters);
            },
           icon: Icon(Icons.save)
           )],
      ),
      drawer:const MainDrawer(),
      body:Column(children: [
        Container(
          height: 100,
          padding: const EdgeInsets.all(20),
          child: const Text("Adjust Your Meal",style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),),
        ),
        Expanded(child: ListView(
          children: [
            SwitchListTile(value: _glutenFree,
            title: const Text("Gluten Free"),
            subtitle: const Text("Only Gluten free Meals"),
             onChanged: (newvalue){
              setState(() {
                _glutenFree=newvalue;
              });

            }),
             SwitchListTile(
                value: _vegan,
                title: const Text("Vegan"),
                subtitle: const Text("Only Vegan free"),
                onChanged: (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
                 SwitchListTile(
                value: _vegetarin,
                title: const Text("Vegetarin"),
                subtitle: const Text("Only Vegetarin Meals"),
                onChanged: (newvalue) {
                  setState(() {
                    _vegetarin = newvalue;
                  });
                }),
                 SwitchListTile(
                value: _lactoseFree,
                title: const Text("Lactose Free"),
                subtitle: const Text("Only Lactose free Meals"),
                onChanged: (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                })
          ],
        ))
      ]),
    );
  }
}
