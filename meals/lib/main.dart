import 'package:flutter/material.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/filter_screen.dart';
import 'package:meals/screen/meal_detail_screen.dart';
import 'package:meals/screen/tabs_screen.dart';

import 'screen/category_meal_screen.dart';
import 'screen/favorites_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/firstroute',
      routes: {
        '/firstroute': (_) => TabsScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
        MealDetailScreen.routeName :(_)=>MealDetailScreen(),
        FavoritesScreen.routeName: (_)=> FavoritesScreen(),
        FilterScreen.routeName: (_)=>FilterScreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (_)=> CategoryScreen());
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//  @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
    
//       home: CategoryScreen();
      
    
//   }

// }