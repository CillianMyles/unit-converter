import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:unit_converter/category.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    @required this.category,
    @required this.onTap,
    Key key,
  })  : assert(category != null),
        assert(onTap != null),
        super(key: key);

  final Category category;
  final ValueChanged<Category> onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: category.color['highlight'],
            splashColor: category.color['splash'],
            onTap: () => onTap(category),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      category.iconLocation,
                      size: 60.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
