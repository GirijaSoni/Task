
import 'package:testapp/favouritesPage.dart';
import 'package:testapp/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:bottom_navigation_bar/home_screen.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();


}

class _homepageState extends State<homepage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    SearchPage(),
    favouritesPage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Color(0xffff4f59),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,color: Color(0xffa99c94),
            ),
            title: Text(
              'Search',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,color: Color(0xffa99c94),
            ),
            title: Text(
              'Favourites',
            ),
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}