import 'package:flutter/material.dart';
import 'package:news_api/view/generate.dart';
import 'package:news_api/view/homepage.dart';
import 'package:news_api/view/image.dart';
import 'package:news_api/view/profile.dart';

class Wraper extends StatefulWidget {
  @override
  _WraperState createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  PageController _pageController = PageController();
  List<Widget> _screens = [HomePage(), Generate(), Images(), Profile()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _itemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _itemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_day,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              title: Text("News",
                  style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              title: Text("QR",
                  style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              title: Text("Image",
                  style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
              ),
              title: Text("Profile",
                  style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : Colors.grey)),
            )
          ]),
    );
  }
}
