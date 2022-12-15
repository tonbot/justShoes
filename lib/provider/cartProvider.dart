import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<int> cartBasket = [];
  int _totalItemInCartBasket = 0;
  Map<String, int> _items = {};
  Map<String, int> _itemss = {};
  int _totalPrice = 0;
  int _sum = 0;
  int _shippingFee = 10;
  int _finalPay = 0;

  //add to cart
  String addToCart(item) {
    //item represent the index of the product in products list
    if (cartBasket.contains(item)) {
      return ("item already added");
    } else {
      cartBasket.add(item);
      updateItemCount();
    }
    return '';
  }

  //update ItemCount
  void updateItemCount() {
    _totalItemInCartBasket = cartBasket.length;
    notifyListeners();
  }

  void removeItem(index, key) {
    cartBasket.remove(index);
    _itemss.remove(key);
    _items.remove(key);
    _totalItemInCartBasket = cartBasket.length;
    _shippingFee = 0;
    _finalPay = 0;
    _sum = 0;

    notifyListeners();
  }

  void addQuantity(String key, int quantity, bool toAdd) {
    //add 1 to item count
    if (toAdd) {
      _items.update(
        key,
        (value) => quantity + value,
        ifAbsent: () => quantity,
      );
      // computePrice(unitPrice);
      updateitems();
    } else {
      _items.update(
        key,
        (value) => value,
        ifAbsent: () => quantity,
      );
      _itemss = _items;
    }
  }

  void subtractQuantity(String key) {
    //subtract 1 to item count
    _items.update(key, (value) {
      if (value == 1) {
        return value;
      }
      return value - 1;
    });
    updateitems();
  }

  void updateitems() {
    _itemss = _items;
    notifyListeners();
  }

  List<int> get itemInBasket => cartBasket;
  //item count
  int get totalItemInCartBasket => _totalItemInCartBasket;

  int get sum => _sum;

  int get shippingFee => _shippingFee;
  int get finalPay => _finalPay;
  //items
  Map<String, int> get itemss => _items;

  void clearCartBasket() {
    cartBasket = [];
    _items = {};
    _totalPrice = 0;
    _sum = 0;
    _shippingFee = 10;
    _finalPay = 0;
    _totalItemInCartBasket = 0;
    notifyListeners();
  }

  void computePrice(List<Map<String, dynamic>> itemDetails) {
    _shippingFee = 10;
    var tota = [];
    var i = 0;
    while (i <= itemDetails.length - 1) {
      _itemss.forEach((key, value) {
        if (itemDetails[i]["productId"] == key) {
          _totalPrice = (int.parse(itemDetails[i]["price"]) * value);
          tota.add(_totalPrice);
          i++;
          // print(_totalPrice);
          return;
        }

        i++;
        return;
      });
    }

    _sum = tota.reduce((a, b) => a + b);
    _finalPay = _sum + _shippingFee;
  }
}
