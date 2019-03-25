import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

const _appName = 'Unit Converter';
const _categoryName = 'Cake';
const _categoryColor = Colors.green;
const _categoryIcon = Icons.cake;

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appName,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: Category(
            name: _categoryName,
            color: _categoryColor,
            iconLocation: _categoryIcon,
          ),
        ),
      ),
    );
  }
}
