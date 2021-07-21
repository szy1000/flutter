import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const URL = 'https://shenzhiyong.com.cn/test.json';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => new _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String number = '';
  String count = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(children: [
        Center(child: Text('Search')),
        RaisedButton(
            onPressed: () async {
              print('add');
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                number = number + '1';
              });
              int count = (prefs.getInt('count') ?? 0) + 1;
              await prefs.setInt('count', count);
            },
            child: Text('add')),
        RaisedButton(
            onPressed: () async {
              print(await SharedPreferences.getInstance());
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                count = prefs.getInt('count').toString();
              });
              // int count = (prefs.getInt('count') ?? 0) + 1;
              // await prefs.setInt('count', count);
            },
            child: Text('get')),
        Center(
          child: Text('number: ${number}'),
        ),
        Center(
          child: Text('count: ${count}'),
        )
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    print('111');
    _getData();
  }

  Future<http.Response> _getData() async {
    final res = await http.get(Uri.parse(URL));

    Map<String, dynamic> map = jsonDecode(res.body);
    print('name: ${map['name']}');
    return res;
    // print(res.body);
  }
}

class CommonModel {
  final String name;
  final String age;

  CommonModel({
    this.name,
    this.age,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      name: json['name'],
      age: json['age'],
    );
  }
}
