import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, this.color, this.textColor, this.text})
      : super(key: key);

  final Color? color;
  final Color? textColor;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
