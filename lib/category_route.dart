import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

const _appName = 'Unit Converter';
const _titleSize = 30.0;
const _titleColor = Colors.black;
final _bgColor = Colors.green[100];
const _defaultIcon = Icons.cake;

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColours = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: _bgColor,
      elevation: 0.0,
      centerTitle: true,
      title: Center(
        child: Text(
          _appName,
          style: TextStyle(
            fontSize: _titleSize,
            color: _titleColor,
          ),
        ),
      ),
    );

    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColours[i],
        iconLocation: _defaultIcon,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    final listView = Container(
      color: _bgColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
