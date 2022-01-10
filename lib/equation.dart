import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Equation extends StatelessWidget {
  final String _equation;

  Equation(this._equation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(20, 20, 80, 1)),
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
