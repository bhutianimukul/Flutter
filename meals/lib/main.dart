import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/filter_screen.dart';
import 'package:meals/screen/meal_detail_screen.dart';
import 'package:meals/screen/tabs_screen.dart';

import 'models/meal.dart';
import 'screen/category_meal_screen.dart';
import 'screen/favorites_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Map<String , bool> filters={ 
    'gluten': false,
    'lactose': false,
    'vegan':false,
    'vegetarian':false
  };
    List<Meal> availableMeals=DUMMY_MEALS;
    List<Meal> favoritesList=[];
   void setFilter(filteredMap){
    setState(() {
          filters=filteredMap;
     availableMeals=DUMMY_MEALS.where((element) {
if(filters['gluten'] && !element.isGlutenFree) return false;
if(filters['lactose'] && !element.isLactoseFree) return false;
if(filters['vegetarian'] && !element.isVegetarian) return false;
if(filters['vegan'] && !element.isVegan) return false;

return true;

     }).toList();
        });
    
  }
  void toggleFav(String id){
    final index=
favoritesList.indexWhere((element) => element.id==id);
 if(index>=0){
setState(() {
  favoritesList.removeAt(index);
  
});
 }else{
   setState(() {
        favoritesList.add(DUMMY_MEALS.firstWhere((element) => element.id==id));
      });
 }
  }
  bool isFav(String id){

   return favoritesList.any((element) => element.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'TrainOne',
          textTheme: ThemeData.dark().textTheme.copyWith(
              title: TextStyle(fontSize: 20),
              body1: TextStyle(fontSize: 20),
              headline: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),

// home: CategoryScreen(),
     
      routes: {
        '/': (_) => TabsScreen(favoritesList),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName :(_)=>MealDetailScreen(toggleFav, isFav),
       // FavoritesScreen.routeName: (_)=> FavoritesScreen(widget.favoritesList),
        FilterScreen.routeName: (_)=>FilterScreen( setFilter ,filters),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (_)=> CategoryScreen());
      },
    );
  }
}

