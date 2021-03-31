//to handle tabs

import 'package:flutter/material.dart';
import 'package:meals/screen/favorites_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
  int _selectedIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String , dynamic>> _pages = [
    {'page':CategoryScreen(), 'title': 'Categories'},
      {'page':FavoritesScreen(), 'title': 'Favorites'},
 
  ];
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     initialIndex: 0,
    //     length: 2,
    //     child: Scaffold(
    //         appBar: AppBar(
    //           title: Text('Meal App'),
    //           bottom: TabBar(
    //             tabs: [
    //               Tab(
    //                 icon: Icon(Icons.category),
    //                 text: 'Categories',
    //               ),
    //               Tab(icon: Icon(Icons.star), text: 'Favorites')
    //             ],
    //           ),
    //         ),
    //         body: TabBarView(
    //           children: [CategoryScreen(), FavoritesScreen()],
    //         )));
  
    void _selectPage(int index) {
    
      //automatic index
      setState(() {
        _selectedIndex = index;
    
      });
  
     
    }

    return Scaffold(
       drawer: MainDrawer(),
           appBar: AppBar(
             
        title: Text(_pages[_selectedIndex]['title'])),
        
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white ,
        currentIndex: _selectedIndex,
      //  type: BottomNavigationBarType.shifting,

        onTap: _selectPage,
        // backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites')),
        ],
      ),
    );
  }
}
