import 'package:flutter/material.dart';
import 'colors.dart';

Container button(String title, Color color) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 20.0,
      bottom: 20.0,
    ),
    color: color,
    // ignore: prefer_const_constructors
    child: Text(
      title,
      style: TextStyle(
        color: white,
      ),
    ),
  );
}
