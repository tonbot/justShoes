import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:justshoes/provider/cartProvider.dart';
import 'package:justshoes/provider/paymentProvider.dart';
import 'package:provider/provider.dart';

final plugin = PaystackPlugin();

void initialisedPaystack() {
  //pb key text for paystack
  var publicKey = 'pk_test_24759ac997861296cfc537455c9e53cb6f7ea845';
  //initialise payment
  plugin.initialize(publicKey: publicKey);
}

//process payment
Future<void> processPayment(context, amount) async {
  String email = 'toy505050@gmail.com';

  Charge charge = Charge()
    ..amount = int.parse("${amount}00")
    ..reference = DateTime.now().millisecondsSinceEpoch.toString()
    // or ..accessCode = _getAccessCodeFrmInitialization()
    //customer email
    ..email = email;
  CheckoutResponse response = await plugin.checkout(
    context,
    method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
    charge: charge,
  );
  print(response);

  if (response.message == "Success") {
    String paymentReference = response.reference.toString();
    Provider.of<PaymentProvider>(context, listen: false)
        .addPaymentToHistory(amount.toString(), email, paymentReference);
    Provider.of<CartProvider>(context, listen: false).clearCartBasket();
  }
}
