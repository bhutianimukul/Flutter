import 'package:flutter/material.dart';
import 'package:meals/screen/categories_screen.dart';
void main()=>runApp( MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness:  Brightness.dark,
      ) ,
      themeMode: ThemeMode.dark,
      theme:ThemeData(primaryColor:  Colors.red,
     ),
      
home: HomePage(),
      
    );

  }
}

class HomePage extends StatefulWidget {
 @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Meals App"),),
      body: CategoryScreen(),
      
    );
  }

}