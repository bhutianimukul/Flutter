import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName='/favRoute';
  final List<Meal> favList;
  
  FavoritesScreen(this.favList);
  

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
 

  @override
  Widget build(BuildContext context) {
   if(widget.favList.length==0) {return Text('No Favorites Yet');}
   else{
  return Container(
child: ListView.builder(itemBuilder: (context , index){
  return MealItem(
       id: widget.favList[index].id,
     title: widget.favList[index].title,
     imageUrl: widget.favList[index].imageUrl,
      duration:widget.favList[index].duration,
   complexity: widget.favList[index].complexity,
    affordable : widget.favList[index].affordability,
    );

}, itemCount: widget.favList.length,),
  );
    
  }}
}