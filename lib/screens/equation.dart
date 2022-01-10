import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Equation extends StatelessWidget {
  final String _equation;

  Equation(this._equation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purpleAccent),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          '$_equation',
          maxLines: 2,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
