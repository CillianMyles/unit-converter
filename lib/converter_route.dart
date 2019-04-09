import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

class ConverterRoute extends StatelessWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: color,
      elevation: 0.0,
      title: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );

    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: appBar,
      body: ListView(children: unitWidgets),
    );
  }
}
