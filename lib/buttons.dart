import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Buttons extends StatelessWidget {
  final bool operator;
  final String keyPressed;
  final Function _clickHandler;

  Buttons(this.keyPressed, this.operator, this._clickHandler);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(keyPressed.toString()),
      onPressed: () => _clickHandler(keyPressed, operator),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: operator
            ? Color.fromRGBO(10, 10, 40, 1)
            : Color.fromRGBO(20, 20, 80, 1),
        primary: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
    // );
  }
}
