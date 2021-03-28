import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10),
      padding: const EdgeInsets.all(20),
      child: Text(title),
     // color: color,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color, Colors.black54],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
