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
  int _result = 0;

  void _incrementCounter(int keyPressed) {
    print(
      'hey $keyPressed',
    );
    print(keyPressed.runtimeType);

    setState(() {
      _result = _result + keyPressed;
    });
  }

  Widget buttonKeys(String buttonText, bool operator) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          backgroundColor: Color.fromRGBO(20, 20, 80, 1),
          primary: Colors.white,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () => _incrementCounter(7),
        child: Text(buttonText));
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
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "clclc",
                  style: TextStyle(fontSize: 20),
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
                        buttonKeys('7'),
                        buttonKeys('8'),
                        buttonKeys('9'),
                        buttonKeys('('),
                        buttonKeys(')'),
                      ],
                    ),
// Expanded()
                    SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonKeys('4'),
                          buttonKeys('5'),
                          buttonKeys('6'),
                          buttonKeys('*'),
                          buttonKeys('/')
                        ]),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys('1'),
                        buttonKeys('2'),
                        buttonKeys('3'),
                        buttonKeys('+'),
                        buttonKeys('-'),
                      ],
                    ),
                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeys('0'),
                        buttonKeys('.'),
                        buttonKeys('+/-'),
                        buttonKeys('exp'),
                        buttonKeys('='),
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