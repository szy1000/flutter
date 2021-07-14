import 'package:flutter/material.dart';
import 'package:myapp/navigator/tab_navigator.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: TabNavigator(),
    );
  }
}

