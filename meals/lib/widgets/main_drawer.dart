// to  manage side drawer
import 'package:flutter/material.dart';
import 'package:meals/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 50,
            ),
            title: Text('Meals', style: TextStyle(fontSize: 40),
            
            ),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
          //  onTap: ()=>Navigator.of(context).pushNamed('\');

          ),
          SizedBox(height: 30),
            ListTile(
            leading: Icon(
              Icons.settings,
              size: 50,
            ),
            title: Text('filter', style: TextStyle(fontSize: 40),
            
            ),
            onTap:   (){Navigator.pushNamed(context, FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
