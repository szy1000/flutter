import 'package:flutter/material.dart';
import 'package:myapp/navigator/tab_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    return MaterialApp(
      debugShowCheckedModeBanner: false, //禁止显示右上角的debugger图标
      title: 'demo',
      home: TabNavigator(),
    );
  }
}
