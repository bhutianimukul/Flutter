//to display specific dishes of categories
import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'categoryMeals';
  // final String Categoryid;
  // final String Categorytitle;
  // CategoryMealScreen(this.Categoryid,this.Categorytitle);
  @override
  Widget build(BuildContext context) {
    //extracting
    var routesarg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final dishtitle = routesarg['title'];
    final dishId = routesarg['id'];
    final dishList = DUMMY_MEALS.where((element) {
      return element.categories.contains(dishId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${dishtitle}_Dishes ',
      )),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: dishList[index].id,
            title: dishList[index].title,
            imageUrl: dishList[index].imageUrl,
            complexity: dishList[index].complexity,
            affordable: dishList[index].affordability,
            duration: dishList[index].duration,
          );
        },
        itemCount: dishList.length,
      )),
    );
  }
}
