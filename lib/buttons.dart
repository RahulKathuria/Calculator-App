import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final buttonColor;
  final textColor;
  final buttonText;
  final buttonTapped;

  MyButton({this.buttonColor, this.textColor, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
          child: Padding(
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
      ),
    );
  }

  
}
