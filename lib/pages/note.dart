import 'package:flutter/material.dart';
import 'package:myapp/dao/travel_tab_dao.dart';
import 'package:myapp/model/travel_model.dart';
import 'package:myapp/model/travel_tab_model.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePage createState() => new _NotePage();
}

class _NotePage extends State<NotePage> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Groups> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then((TravelTabModel model) {
      setState(() {
        tabs = model.tabs;
        travelTabModel = model.travelTabModel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(child: Text('Note')),
    );
  }
}
