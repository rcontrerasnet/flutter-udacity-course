import 'package:flutter/material.dart';
import 'package:hello_rectangle/converter_route.dart';
import 'package:hello_rectangle/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final IconData icon;
  final String name;
  final ColorSwatch color;
  final List<Unit> units;

  const Category(
      {Key key, @required this.icon, @required this.name, @required this.color, @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(icon != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            color: color,
            name: name,
            units: units,
          ),
          resizeToAvoidBottomPadding: false,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: this.color['highlight'],
          splashColor: this.color['splash'],
          onTap: () {
            _navigateToConverter(context);
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
