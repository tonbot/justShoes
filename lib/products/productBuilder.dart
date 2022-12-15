import 'package:flutter/material.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/componet/scaffoldMessenger.dart';
import 'package:justshoes/componet/spaces.dart';
import 'package:justshoes/products/productsList.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';

var itemList = product();
String response = '';

Widget productBuilder(context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Row(
            children: [
              //first column starts
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(itemList[index]["imageUrl"],
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              //first column ends
              //second column starts
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          itemList[index]["name"],
                          style: TextStyle(
                            color: black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(5.0),
                      Text(
                        "# ${itemList[index]["price"]}. 00",
                        style: TextStyle(
                          color: accent1,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(5.0),
                      // Text(
                      //   itemList[index]["productId"],
                      // ),
                      // verticalSpace(5.0),
                      GestureDetector(
                        onTap: () {
                          putToCart(context, index); //ADD TO CART
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: black,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                color: white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              //second column ends
              //third column starts
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        //third column ends
      },
      childCount: itemList.length,
    ),
  );
}
