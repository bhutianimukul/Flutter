// to display recipe
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetailScreen';
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArg['id'];
    Meal meal;
    for (Meal m in DUMMY_MEALS) {
      if (m.id == mealId) {
        meal = m;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
        ('${meal.title}'),
      )),
      body: Center(
        child: Image.network(meal.imageUrl),
      ),
    );
  }
}
