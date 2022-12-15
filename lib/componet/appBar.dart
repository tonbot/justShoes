import 'package:flutter/material.dart';
import 'package:justshoes/componet/cartBasket.dart';
import 'package:justshoes/componet/colors.dart';

AppBar appBar(title, context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, "/PaymentHistory"),
      child: Icon(
        Icons.payment_outlined,
        color: black,
      ),
    ),
    actions: [
      GestureDetector(
          onTap: (() {
            Navigator.pushReplacementNamed(context, "/CartScreen");
          }),
          child: cartBasket()),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: Text(
        title,
        style: TextStyle(color: black),
      ),
    ),
  );
}
