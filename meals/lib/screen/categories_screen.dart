
// front screen that displays all the title of categories 
import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Categories'),),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.4,
        
          maxCrossAxisExtent: 200,
        ),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(data.id, data.title, data.color))
            .toList(),
        //CategoryItem(title, color),
      ),
    );
  }
}
