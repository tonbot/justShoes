import 'package:flutter/material.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/payment/paymentHistoryBuilder.dart';
import 'package:justshoes/provider/paymentProvider.dart';
import 'package:provider/provider.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> paymentHistory =
        Provider.of<PaymentProvider>(context, listen: true).paymentHistory;
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "Payment History",
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
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: black,
                ),
              )
            ]),
        body: Container(
          padding: EdgeInsets.only(top: 9),
          child: CustomScrollView(slivers: [myPaymentHistory(context)]),
        ));
  }
}
