import 'package:flutter/material.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/provider/cartProvider.dart';
import 'package:provider/provider.dart';

Padding cartBasket() {
  return Padding(
    padding: const EdgeInsets.only(right: 25.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.shopping_cart_sharp,
          color: black,
        ),
        Positioned(
          top: 5.0,
          left: 17.0,
          child: Container(
            height: 20,
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: accent3, borderRadius: BorderRadius.circular(10.0)),
            child: Consumer(
              builder: (context, value, Widget? child) {
                return Text(
                  Provider.of<CartProvider>(context, listen: true)
                      .totalItemInCartBasket
                      .toString(),
                );
              },
            ),
          ),
        )
      ],
    ),
  );
}
