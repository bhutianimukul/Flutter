import 'package:flutter/material.dart';
import 'package:meals/screen/categories_screen.dart';

import 'screen/category_meal_screen.dart';
void main()=>runApp( MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness:  Brightness.dark,
        fontFamily: 'TrainOne',
        textTheme: ThemeData.dark().textTheme.copyWith(
          title: TextStyle(fontSize: 20 ),
            body1: TextStyle(fontSize: 20 ),
        )
        
      ) ,
      themeMode: ThemeMode.dark,
      theme:ThemeData(primaryColor:  Colors.red,
    
     ),
      
// home: CategoryScreen(),
initialRoute: '/firstroute',
      routes:{
        '/firstroute': (_)=>CategoryScreen(),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(),
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