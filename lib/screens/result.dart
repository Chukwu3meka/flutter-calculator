import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Result extends StatelessWidget {
  final String _result;

  Result(this._result);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        _result,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
