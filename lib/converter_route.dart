import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:hello_rectangle/unit.dart';

class ConverterRoute extends StatelessWidget{
  
  final List<Unit> units;
  final String categoryName;
  final ColorSwatch categoryColor;

  const ConverterRoute({
    @required this.units,
    @required this.categoryName,
    @required this.categoryColor,
  }) : assert(units != null),
       assert(categoryName != null),
       assert(categoryColor != null);

  @override
  Widget build(BuildContext context){

    final unitWidgets = units.map((Unit unit){

      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: this.categoryColor,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style:Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    final listView = ListView(
      children: unitWidgets,
    );

    final appBar = AppBar(
      title: Text(
        'Convert Route',
        style: TextStyle(
          color: this.categoryColor,
          fontSize: 30.0
        ),
      )
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}