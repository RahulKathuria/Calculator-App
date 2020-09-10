import 'package:calcapp/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return MyButton(
                        buttonText: buttons[index],
                        buttonColor: isOperator(buttons[index]) ? Colors.green : Colors.greenAccent[200],
                        textColor: isOperator(buttons[index]) ? Colors.white : Colors.green,
                      );
                    }),
              )),
        ],
      ),
    );
  }
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '+' || x == '-' || x == '='|| x == 'x')
      return true;
    else
      return false;
  }
}
