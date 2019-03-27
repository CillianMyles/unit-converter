import 'package:flutter/material.dart';
import 'package:unit_converter/category_screen.dart';

const _appName = 'Unit Converter';
final _bgColor = Colors.green[100];

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appName,
      home: Scaffold(
        backgroundColor: _bgColor,
        body: CategoryScreen(),
      ),
    );
  }
}
