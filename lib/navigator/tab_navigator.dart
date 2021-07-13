import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/my.dart';
import 'package:myapp/pages/note.dart';
import 'package:myapp/pages/search.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          NotePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              title: Text('首页',
                  style: TextStyle(
                      color:
                          _currentIndex != 0 ? _defaultColor : _activeColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.search,
                color: _activeColor,
              ),
              title: Text('搜索',
                  style: TextStyle(
                      color:
                          _currentIndex != 1 ? _defaultColor : _activeColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note_outlined,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.event_note_outlined,
                color: _activeColor,
              ),
              title: Text('笔记',
                  style: TextStyle(
                      color:
                          _currentIndex != 2 ? _defaultColor : _activeColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              title: Text('我的',
                  style: TextStyle(
                      color:
                          _currentIndex != 3 ? _defaultColor : _activeColor))),
        ],
      ),
    );
  }
}
