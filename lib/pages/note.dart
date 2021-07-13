import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePage createState() => new _NotePage();
}

class _NotePage extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(child: Text('Note')),
    );
  }
}
