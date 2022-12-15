import 'package:flutter/material.dart';

class ProductDescriptionProvider extends ChangeNotifier {
  int _itemId = 0;

  //
  void setItemId(itemId) {
    _itemId = itemId;
    notifyListeners();
  }

  //item id
  int get itemId => _itemId;
}
