import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

import './result.dart';
import './buttons.dart';
import './equation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'ViewCrunch Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = "0";
  String _equation = "0";

  void _clickHandler(String keyPressed, bool operator) {
    switch (keyPressed) {
      case "C":
        setState(() {
          _equation = "0";
          _result = "0";
        });
        break;
      case "DEL":
        if (_equation.length > 0) {
          print(_equation.substring(0, _equation.length - 1));
          setState(() {
            _equation = _equation.substring(0, _equation.length - 1);
          });
        }
        break;
      case "=":
        try {
          Parser p = new Parser();
          Expression exp =
              p.parse(_equation.replaceAll("x", "*").replaceAll("÷", "/"));
          ContextModel cm = ContextModel();

          double initialResult = (exp.evaluate(EvaluationType.REAL, cm));

          int initialResultDecimal =
              int.parse(initialResult.toString().split('.')[1].substring(0));

          setState(() {
            _result = initialResultDecimal == 0
                ? initialResult.toStringAsFixed(0)
                : initialResult.toString().split('.')[1].substring(0).length >=
                        11
                    ? initialResult.toStringAsFixed(4)
                    : initialResult.toString();
          });
        } catch (e) {
          print(e);
          setState(() {
            _result = 'Error';
          });
        }
        break;
      default:
        setState(() {
          _equation = '$_equation$keyPressed';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Container(
          child: Column(
            children: [
              Equation(_equation),
              Result(_result),
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: constraint.maxWidth,
                // height: constraint.maxHeight - 130.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent),
                  color: Colors.blueGrey[600],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttons('C', true, _clickHandler),
                        Buttons('%', true, _clickHandler),
                        Buttons('Exp', true, _clickHandler),
                        Buttons('DEL', true, _clickHandler),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttons('+/-', true, _clickHandler),
                        Buttons('(', true, _clickHandler),
                        Buttons(')', true, _clickHandler),
                        Buttons(' - ', true, _clickHandler),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttons('7', false, _clickHandler),
                        Buttons('8', false, _clickHandler),
                        Buttons('9', false, _clickHandler),
                        Buttons(' + ', true, _clickHandler),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons('4', false, _clickHandler),
                          Buttons('5', false, _clickHandler),
                          Buttons('6', false, _clickHandler),
                          Buttons(' * ', true, _clickHandler),
                        ]),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttons('1', false, _clickHandler),
                        Buttons('2', false, _clickHandler),
                        Buttons('3', false, _clickHandler),
                        Buttons(' ÷ ', true, _clickHandler)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttons('.', false, _clickHandler),
                        Buttons('0', false, _clickHandler),
                        Buttons('00', false, _clickHandler),
                        Buttons('=', true, _clickHandler),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
