import 'package:flutter/material.dart';
import 'package:justshoes/componet/appBar.dart';
import 'package:justshoes/componet/carouselSlider.dart';
import 'package:justshoes/componet/colors.dart';
import 'package:justshoes/componet/spaces.dart';
import 'package:justshoes/products/productBuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(249, 255, 255, 255),
        appBar: appBar("JustShoes", context),
        body: Container(
          padding: EdgeInsets.only(top: 9),
          child: CustomScrollView(slivers: [
            sliverList(header()),
            sliverList(carouselSlider(context)),
            productBuilder(context),

            // verticalSpace(5.0),
            // //scrolling products image horizontal

            // //products item list
            // productBuilder(context),
          ]),
        ));
  }

  //header title
  Widget header() {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        left: 20.0,
        bottom: 25.0,
      ),
      child: Text(
        "Find your style",
        style: TextStyle(
          color: black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget sliverList(message) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return message;
      },
      childCount: 1,
    ),
  );
}
