import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final buttonColor;
  final textColor;
  final buttonText;

  MyButton({this.buttonColor, this.textColor, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: buttonColor,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 20),
          )),
        ),
      ),
    );
  }

  
}
