import 'package:flutter/material.dart';
import 'package:justshoes/componet/button.dart';
import 'package:justshoes/componet/carouselSlider.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/payment/paystack.dart';
import 'package:justshoes/products/myCartBuilder.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    initialisedPaystack();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "My cart",
              style: TextStyle(color: black),
            )),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, "/Home"),
                child: Icon(
                  Icons.arrow_back,
                  color: black,
                )),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: black,
                ),
              )
            ]),
        body: Container(
          padding: EdgeInsets.only(top: 9),
          child: CustomScrollView(slivers: [
            myCartBuilder(context),
            sliverList(total()),
          ]),
        ));
  }

  Widget total() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sub-Total",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "# ${Provider.of<CartProvider>(context, listen: true).sum}.00",
                style: TextStyle(
                  color: accent1,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shipping",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "# ${Provider.of<CartProvider>(context, listen: true).shippingFee}'00",
                style: TextStyle(
                  color: accent1,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "# ${Provider.of<CartProvider>(context, listen: true).finalPay}.00",
                style: TextStyle(
                  color: accent1,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () {
                var amount =
                    Provider.of<CartProvider>(context, listen: false).finalPay;
                //payment.dart file
                processPayment(context, amount).toString();
              },
              child: button("Checkout", accent1)),
        )
      ],
    );
  }
}

Widget sliverList(message) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return message;
      },
      childCount: 1,
    ),
  );
}
