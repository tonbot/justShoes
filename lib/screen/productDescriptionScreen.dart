import 'package:flutter/material.dart';
import 'package:justshoes/componet/cartBasket.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/componet/spaces.dart';
import 'package:justshoes/products/productsList.dart';
import 'package:justshoes/provider/productDescriptionProvider.dart';
import 'package:provider/provider.dart';
import '../componet/button.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  var itemList = product();

  @override
  Widget build(BuildContext context) {
    var itemId =
        Provider.of<ProductDescriptionProvider>(context, listen: true).itemId;

    return Scaffold(
        backgroundColor: Color.fromARGB(249, 255, 255, 255),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, "/Home"),
                child: Icon(
                  Icons.arrow_back,
                  color: black,
                )),
            actions: [
              cartBasket()
              // Padding(
              //   padding: EdgeInsets.only(right: 15.0),
              //   child: Icon(
              //     Icons.favorite_border_outlined,
              //     color: black,
              //   ),
              // )
            ]),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(itemList[itemId]["imageUrl"],
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemList[itemId]["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "#${itemList[itemId]["price"]}.00",
                            style: TextStyle(
                                color: accent1,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                fontFamily: "RobotoMono"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "wekfsankl fasndfklans;klnklafnasv k vjas vajk avj vadv ajv av aji vas vh ashvbja jhsdvj auhfe r j a av vha vjk a j asvia dvkadjiva kvjasvjkas vkav",
                  style: TextStyle(
                      color: accent1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: "RobotoMono"),
                ),
              ),
              verticalSpace(30.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {
                      putToCart(context, itemId);
                    },
                    child: button("Add to Cart", accent1)),
              ),
            ],
          ),
        ));
  }
}
