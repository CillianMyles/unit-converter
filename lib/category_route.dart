import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/constants.dart';
import 'package:unit_converter/unit.dart';

const _defaultIcon = Icons.cake;

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];

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

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
        name: _categoryNames[i],
        color: _baseColours[i],
        iconLocation: _defaultIcon,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  Widget _buildCategoryWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _categories[index],
      itemCount: _categories.length,
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
      backgroundColor: bgColor,
      elevation: 0.0,
      centerTitle: true,
      title: Center(
        child: Text(
          appName,
          style: TextStyle(
            fontSize: titleSize,
            color: titleColor,
          ),
        ),
      ),
    );

    final listView = Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
