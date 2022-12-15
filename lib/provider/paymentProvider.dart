import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  final List<Map<String, String>> _paymentHistory = [];

  void addPaymentToHistory(
      String amount, String email, String paymentReference) {
    Map<String, String> map = {
      "amount": amount,
      "email": email,
      "reference": paymentReference,
    };
    _paymentHistory.add(map);
    notifyListeners();
  }

  List<Map<String, String>> get paymentHistory => _paymentHistory;
}
