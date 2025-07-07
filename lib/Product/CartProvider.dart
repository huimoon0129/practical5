import 'package:flutter/cupertino.dart';
import 'package:shopping_card/Product/Item.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> itemList = [];

  void add(Item product){
    itemList.add(product);
    notifyListeners();
  }

  void remove(Item product){
    itemList.remove(product);
    notifyListeners();
  }

}
