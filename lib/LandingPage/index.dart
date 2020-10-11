import 'package:demo/HomePage/homePage.dart';
import 'package:demo/MenuPage/menuPage.dart';
import 'package:demo/PersonPage/personPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeNavigation extends StatefulWidget {
  @override
  BottomNavigationWidget createState() => BottomNavigationWidget();
}

class BottomNavigationWidget extends State<HomeNavigation> {
  final tabs = [
    DashboardScreen(),
    PersonPage(),
    MenuPage()
  ];
  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            fillColor: Colors.white38, filled: true,
            contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: "Search",
            prefixIcon: Icon(Icons.search)
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            DashboardScreen(),
            PersonPage(),
            MenuPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar
      (
        currentIndex: _currentIndex,
        onTap: (index){
          onAddButtonTapped(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            backgroundColor: Colors.red,
            title: Text('Trang chủ'),
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
      ),
    );
  }
  void onAddButtonTapped(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,duration: Duration(milliseconds: 100), curve: Curves.easeOut);
      _pageController.jumpToPage(index);
    });
}
}