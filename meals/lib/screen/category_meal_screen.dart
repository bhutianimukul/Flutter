//to display specific dishes of categories
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';
final List<Meal> availableMeals;

  const CategoryMealScreen( this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String dishtitle;
  List <Meal> dishList;

  @override
    void initState() {
   
      super.initState();
    }
    @override
      void didChangeDependencies() {
        var routesarg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    dishtitle = routesarg['title'];
    final dishId = routesarg['id'];
     dishList = widget.availableMeals.where((element) {
      return element.categories.contains(dishId);
    }).toList();
        super.didChangeDependencies();
      }
   void removeItem(value){
     setState(() {
             dishList.removeWhere((element) => element.id==value);
          });
     
    }
  @override
  Widget build(BuildContext context) {
   
    //extracting
   
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
            removeItem: removeItem,
          );
        },
        itemCount: dishList.length,
      )),
    );
  }
}
