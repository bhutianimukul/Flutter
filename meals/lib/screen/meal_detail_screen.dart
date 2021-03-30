// to display recipe
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetailScreen';
  Widget buildTitle(context, String s){
   return  Container(
            child: Text(
              s,
              style: TextStyle(fontSize: 30),
            ),
          );
  }
  Widget buildBackGround(context, child){
   return   Container(
     
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: Colors.white),
         ),
            height: MediaQuery.of(context).size.height*0.19,
            width: MediaQuery.of(context).size.width,
            child: child,);
  }
  Widget buildListTile(list){
   return  ListView.builder(itemBuilder:(context , index){
              return Card(
                
                child: Text(list[index],style: TextStyle(fontFamily:'' ),),

              );
            } , itemCount: list.length);
  }
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
           buildTitle(context, 'Ingredients'),
           SizedBox(height: 10),
            buildBackGround(context, buildListTile(meal.ingredients)
            ),
            SizedBox(height: 10),
              buildTitle(context , 'Recipee'),
              SizedBox(height: 10),
              buildBackGround(context, ListView.builder(itemBuilder: (context, index){ return ListTile(
                leading: CircleAvatar(child: Text("# ${index+1}"),),
                title: Text(meal.steps[index] , style: TextStyle(fontFamily: '', color: Colors.black),),
              );}, itemCount: meal.steps.length,)),
              SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
