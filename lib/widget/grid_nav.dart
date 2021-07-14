import 'package:flutter/material.dart';
import 'package:myapp/model/grid_nav_model.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  final String name;
  const GridNav({Key key, @required this.gridNavModel, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}

// class GridNav extends StatelessWidget {
//   final GridNavModel gridNavModel;
//   final String name;
//   const GridNav({Key key, @required this.gridNavModel, this.name}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(name),
//     );
//   }
// }

// class GridNav extends StatefulWidget {
//   final GridNavModel gridNavModel;
//   final String name;
//
//   const GridNav({Key key, @required this.gridNavModel, this.name})
//       : super(key: key);
//
//   @override
//   _GridNavState createState() => _GridNavState();
// }
//
// class _GridNavState extends State<GridNav> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(widget.name),
//     );
//   }
// }
