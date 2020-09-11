import 'dart:ui';

import 'package:calcapp/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  var userQuestion = "";
  var userAnswer = "";
  int flag = 0;
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
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
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion, style: TextStyle(fontSize: 20))),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 20)))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            if (flag == 1) {
                              userQuestion = "";
                              flag = 0;
                            }
                            userAnswer = "";
                            if (buttons[index] == 'C')
                              userQuestion = "";
                            else if (buttons[index] == 'DEL') {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            } else if (buttons[index] == "=") {
                              equalPressed();
                              flag = 1;
                            } else
                              userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        buttonColor: isOperator(buttons[index])
                            ? Colors.green
                            : Colors.greenAccent[200],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.green,
                      );
                    }),
              )),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '+' || x == '-' || x == '=' || x == '*')
      return true;
    else
      return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
