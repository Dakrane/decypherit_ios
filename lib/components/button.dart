import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final String letter;
  final Function action;
  final Color buttonColor;
  final Color textColor;

  ButtonTemplate({this.letter, this.action, this.buttonColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
//        width: 35.0,
//        height: 55.0,
          decoration: BoxDecoration(
//          boxShadow: ,
            color: buttonColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: MaterialButton(
            onPressed: action,
            child: Text(
              letter,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
