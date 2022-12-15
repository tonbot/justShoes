import 'package:flutter/material.dart';
import 'package:justshoes/componet/carouselSlider.dart';
import 'package:justshoes/componet/cartBasket.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/componet/scaffoldMessenger.dart';
import 'package:justshoes/componet/spaces.dart';
import 'package:justshoes/products/productsList.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';

// All products in display
var products = product();

//method to build product added in cart
Widget myCartBuilder(context) {
  Map<String, int> items =
      Provider.of<CartProvider>(context, listen: true).itemss;
  //initialising ItemDetail in cart basket to be an empty array
  List<Map<String, dynamic>> itemDetailsInBasket = [];
  //initialising Item INDEX in product list to be an empty array
  List<int> indexInProducts = [];
  // get all the item product position number added in cart basket
  List<int> itemInBasket =
      Provider.of<CartProvider>(context, listen: true).itemInBasket;
  //check if there is item in our cart basket
  // if no item in cart basket then message "NO ITEM ADDED YET"
  if (itemInBasket.isEmpty) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: Center(
                child: Text(
              "No Item Added yet",
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
  //get the details of each item added to cart basket
  itemInBasket.forEach((element) {
    itemDetailsInBasket.add(products[element]);
    indexInProducts.add(element);
    Provider.of<CartProvider>(context, listen: true)
        .addQuantity(products[element]["productId"], 1, false);
    // print(Provider.of<CartProvider>(context, listen: true).totalPrice);
  });
//If cart basket is not empty
// build cart widget
  Provider.of<CartProvider>(context, listen: false)
      .computePrice(itemDetailsInBasket);

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
                    width: 140,
                    height: 170,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                          itemDetailsInBasket[index]["imageUrl"],
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
                  height: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          itemDetailsInBasket[index]["name"],
                          style: TextStyle(
                            color: black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(15.0),
                      Text(
                        "# ${itemDetailsInBasket[index]["price"]}. 00",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(15.0),
                      Text(
                        itemDetailsInBasket[index]["productId"],
                        style: const TextStyle(
                          color: Colors.black26,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //ADD OR SUBTRACT CART ITEM
                      verticalSpace(14.0),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .subtractQuantity(
                                itemDetailsInBasket[index]["productId"],
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black26,
                                    width: 1.0,
                                  )),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              items[itemDetailsInBasket[index]["productId"]]
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addQuantity(
                                itemDetailsInBasket[index]["productId"],
                                1,
                                true,
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black26,
                                    width: 1.0,
                                  )),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      //end of add or subtract item
                    ],
                  ),
                ),
              ),
              //second column ends
              //third column starts
              Expanded(
                child: SizedBox(
                  height: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(items);

                          Provider.of<CartProvider>(context, listen: false)
                              .removeItem(indexInProducts[index],
                                  itemDetailsInBasket[index]["productId"]);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //third column ends
            ],
          ),
        );
      },
      childCount: itemDetailsInBasket.length,
    ),
  );
}
