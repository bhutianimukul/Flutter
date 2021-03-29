// item meal like spghetti which on click goes to recipee
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability addordable;

  const MealItem({@required this.title,@required this.duration, @required this.imageUrl,@required this.complexity,@required this.addordable});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
//detail page or recippe page
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //rounded corners
                  //force it into other widget

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                      child: Image.network(imageUrl , height: 250 ,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      ),

                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
