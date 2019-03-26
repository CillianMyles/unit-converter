import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

const _appName = 'Unit Converter';
final _bgColor = Colors.green[100];
const _defaultIcon = Icons.cake;

class CategoryScreen extends StatelessWidget {
  const CategoryScreen();

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

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: _bgColor,
      elevation: 0.0,
      title: Center(
        child: Text(
          _appName,
          style: TextStyle(
            fontSize: 30.0,
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
