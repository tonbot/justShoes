import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justshoes/provider/cartProvider.dart';
import 'package:justshoes/provider/paymentProvider.dart';
import 'package:justshoes/provider/productDescriptionProvider.dart';
import 'package:justshoes/screen/cartScreen.dart';
import 'package:justshoes/screen/homeScreen.dart';
import 'package:justshoes/screen/paymentHistory.dart';
import 'package:justshoes/screen/productDescriptionScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductDescriptionProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => PaymentProvider(),
      )
    ],
    child: MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/Home": (context) => const HomeScreen(),
        "/ProductDescription": (context) => const ProductDescription(),
        "/CartScreen": (context) => const CartScreen(),
        "/PaymentHistory": (context) => const PaymentHistory(),
      },
      home: const HomeScreen(),
    ),
  ));
}
