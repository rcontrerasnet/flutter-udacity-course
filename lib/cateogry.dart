import 'package:flutter/material.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final IconData icon;
  final String name;
  final ColorSwatch color;

  const Category(
      {Key key, @required this.icon, @required this.name, @required this.color})
      : assert(name != null),
        assert(color != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: this.color,
          splashColor: this.color,
          onTap: () {
            print('I was tapped!');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(this.icon, size: 60),
                ),
                Center(
                  child: Text(this.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display1.copyWith(
                            color: this.color,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
