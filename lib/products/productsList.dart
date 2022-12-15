import 'package:flutter/material.dart';
import 'package:justshoes/provider/cartProvider.dart';
import 'package:provider/provider.dart';

import '../componet/scaffoldMessenger.dart';

List<Map<String, dynamic>> product() {
  return [
    {
      "name": "Nike Airmax Furyosa",
      "price": "1500",
      "productId": "kbnk",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3wdElyOubSCu1hw3p9sZeu0ZmbWcvT_4V4A&usqp=CAU",
    },
    {
      "name": "Adidas Adimatic",
      "price": "8300",
      "productId": "879hh ",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxgRNoV2flYMpxKdrdY3jGfaDri9nGfXmlpKGNOnN6N7KLG4HkiCeqhA1Uj_NNVrhDl4E&usqp=CAU",
    },
    {
      "name": "Run star Hike",
      "price": "2000",
      "productId": "ytuu7",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgtaLzhmjt1NI1W5phGwt5F1-7GDFJ0jb_Q&usqp=CAU",
    },
    {
      "name": "Nike Airmax Furyosa",
      "price": "1500",
      "productId": "kbnk3",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3wdElyOubSCu1hw3p9sZeu0ZmbWcvT_4V4A&usqp=CAU",
    },
    {
      "name": "Adidas Adimatic",
      "price": "8300",
      "productId": "879hh3",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxgRNoV2flYMpxKdrdY3jGfaDri9nGfXmlpKGNOnN6N7KLG4HkiCeqhA1Uj_NNVrhDl4E&usqp=CAU",
    },
  ];
}

//add to cart function
putToCart(BuildContext context, int index) {
  var response =
      Provider.of<CartProvider>(context, listen: false).addToCart(index);

  if (response != '') {
    scaffoldMessenger(context, "Item Already Added");
    return;
  }
  scaffoldMessenger(context, "Item Added Succesfully");
}
