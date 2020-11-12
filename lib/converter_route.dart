import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:unit_converter/constants.dart';
import 'package:unit_converter/unit.dart';

class ConverterRoute extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: widget.color,
      elevation: 0.0,
      title: Center(
        child: Text(
          widget.name,
          style: TextStyle(
            fontSize: titleSize,
            color: titleColor,
          ),
        ),
      ),
    );

    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
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
