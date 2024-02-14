import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({super.key, this.size=25,required this.text, this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
