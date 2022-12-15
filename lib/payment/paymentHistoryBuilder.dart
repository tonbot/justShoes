import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/paymentProvider.dart';

//method to build product added in cart
Widget myPaymentHistory(context) {
  var paymentList =
      Provider.of<PaymentProvider>(context, listen: true).paymentHistory;

  if (paymentList.isEmpty) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: Center(
                child: Text(
              "You Have no payment Yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            )),
          );
        },
        childCount: 1,
      ),
    );
  }

  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "${paymentList[index]["email"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "${paymentList[index]["reference"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${paymentList[index]["amount"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "paid",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Divider(
                thickness: 2.0,
              ),
            ],
          ),
        );
      },
      childCount: paymentList.length,
    ),
  );
}
