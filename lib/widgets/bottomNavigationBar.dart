import 'package:flutter/material.dart';


class HomeNavigation extends StatefulWidget {
  @override
  BottomNavigationWidget createState() => BottomNavigationWidget();
}

class BottomNavigationWidget extends State<HomeNavigation> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar
      (
        currentIndex: _currentIndex,
        onTap: (index) {
          setState((){
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.red,
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Cá nhân'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Thiết lập'),
            backgroundColor: Colors.blue,
          )
        ]
      );
  }
}