import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

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
  String _equation = "";

  void _appendEquationHandler(keyPressed, bool operator) {
    print('${keyPressed.runtimeType} hey $keyPressed');

    setState(() {
      _equation = '$_equation$keyPressed';
    });
  }

  Widget buttonKeys(var buttonText, bool operator) {
    return TextButton(
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
        onPressed: () {
          switch (buttonText) {
            case "C":
              setState(() {
                _equation = "";
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
                Expression exp = p
                    .parse(_equation.replaceAll("x", "*").replaceAll("÷", "/"));
                ContextModel cm = ContextModel();

                double initialResult = (exp.evaluate(EvaluationType.REAL, cm));

                int initialResultDecimal = int.parse(
                    initialResult.toString().split('.')[1].substring(0));

                setState(() {
                  _result = initialResultDecimal == 0
                      ? initialResult.toStringAsFixed(0)
                      : initialResult
                                  .toString()
                                  .split('.')[1]
                                  .substring(0)
                                  .length >=
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
              _appendEquationHandler(buttonText, operator);
          }
        },
        child: Text(buttonText.toString()));
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
              Container(
                width: constraint.maxWidth,
                height: 130.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent),
                ),
                child: Text(
                  '$_equation',
                  maxLines: 1,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  _result,
                  style: TextStyle(fontSize: 40),
                ),
              ),
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
                        buttonKeys('C', true),
                        buttonKeys('%', true),
                        buttonKeys('Exp', true),
                        buttonKeys('DEL', true),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys('+/-', true),
                        buttonKeys('(', true),
                        buttonKeys(')', true),
                        buttonKeys(' - ', true),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys(7, false),
                        buttonKeys(8, false),
                        buttonKeys('9', false),
                        buttonKeys(' + ', true),
                      ],
                    ),
// Expanded()
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonKeys('4', false),
                          buttonKeys('5', false),
                          buttonKeys('6', false),
                          buttonKeys(' * ', true),
                        ]),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys('1', false),
                        buttonKeys('2', false),
                        buttonKeys('3', false),
                        buttonKeys(' ÷ ', true)
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys('.', false),
                        buttonKeys('0', false),
                        buttonKeys('00', false),
                        buttonKeys('=', true),
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
