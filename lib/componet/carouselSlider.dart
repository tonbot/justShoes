import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:justshoes/componet/scaffoldMessenger.dart';
import 'package:justshoes/products/productsList.dart';
import 'package:justshoes/provider/cartProvider.dart';
import 'package:provider/provider.dart';

import '../provider/productDescriptionProvider.dart';

var imgList = product();
String response = '';
var provider = Provider.of<ProductDescriptionProvider>;

List<Widget> imageSliders(context) {
  return imgList
      .map((item) => GestureDetector(
            onTap: () {
              provider(context, listen: false).setItemId(imgList.indexOf(item));
              Navigator.pushReplacementNamed(context, "/ProductDescription");
            },
            child: Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item["imageUrl"],
                            fit: BoxFit.cover, width: 500.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '${item["name"]}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ))
      .toList();
}

Widget carouselSlider(context) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 150,
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: false,
    ),
    items: imageSliders(context),
  );
}
