// item meal like spghetti which on click goes to recipee
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordable;
  Widget bottomShow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  String get complexityString {
    if (complexity == Complexity.Simple)
      return 'Simple';
    else if (complexity == Complexity.Hard)
      return 'Hard';
    else
      return 'Interesting';
  }

  String get affordabilityString {
    if (affordable == Affordability.Affordable)
      return 'Affordable';
    else if (affordable == Affordability.Pricey)
      return 'Pricey';
    else
      return 'Royal';
  }

  void recipeePage(context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: {
      'id': id,

    });
  }

  const MealItem(
      {@required this.id,
        @required this.title,
      @required this.duration,
      @required this.imageUrl,
      @required this.complexity,
      @required this.affordable});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => recipeePage(context),
//detail page or recippe page

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
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                FittedBox(),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black45, Colors.black45],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  bottomShow(Icons.schedule, duration.toString() + ' min '),
                  bottomShow(Icons.work, complexityString),
                  bottomShow(Icons.attach_money, affordabilityString),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
