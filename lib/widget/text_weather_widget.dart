import 'package:flutter/material.dart';

Widget textWeather(String text, double fontSize,FontWeight fWeight) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fWeight,
      ),
    ),
  );
}
