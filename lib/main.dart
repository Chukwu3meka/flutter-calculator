import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int _result = 0;

  void _incrementCounter(int keyPressed) {
    print('hey $keyPressed');

    setState(() {
      _result = _result + keyPressed;
    });
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
                  '$_result',
                  maxLines: 1,
                  style: TextStyle(),
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
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => _incrementCounter(7),
                          child: const Text('7'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('8'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('9'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('('),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text(')'),
                        )
                      ],
                    ),
// Expanded()
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('4'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('5'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('6'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('*'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('/'),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('1'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('2'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('3'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('+'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('-'),
                        )
                      ],
                    ),
// 0 . +/- exp =
                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('0'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('.'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('+/-'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('exp'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: Color.fromRGBO(20, 20, 80, 1),
                            primary: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () => {print("hey")},
                          child: const Text('='),
                        )
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
