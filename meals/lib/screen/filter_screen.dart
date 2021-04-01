import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';
  final Function setFilter;
  final Map<String , bool> mainFiltered;
  FilterScreen(this.setFilter,this.mainFiltered);
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;
  @override
    void initState() {
      gluten=widget.mainFiltered['gluten'];
      lactose=widget.mainFiltered['lactose'];
      vegan=widget.mainFiltered['vegan'];
      vegetarian=widget.mainFiltered['vegetarian'];
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Apply Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final  filters={ 
    'gluten': gluten,
    'lactose': lactose,
    'vegan':vegan,
    'vegetarian': vegetarian
  };
                return widget.setFilter(filters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(10),
            child: Text(
              'Filter Selection',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten Free'),
                value: gluten,
                onChanged: (bool value) {
                  setState(() {
                    gluten = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose Free'),
                value: lactose,
                onChanged: (bool value) {
                  setState(() {
                    lactose = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                value: vegetarian,
                onChanged: (bool value) {
                  setState(() {
                    vegetarian = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: vegan,
                onChanged: (bool value) {
                  setState(() {
                    vegan = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
