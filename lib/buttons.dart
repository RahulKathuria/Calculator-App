import 'dart:html';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final buttonColor;
  final textColor;
  final buttonText;

  MyButton({this.buttonColor, this.textColor, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: buttonColor,
        child: Center(child: Text(buttonText,style: TextStyle(
          color:textColor
        ),)),
      ),
    );
  }
}
