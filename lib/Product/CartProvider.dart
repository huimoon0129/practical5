import 'package:flutter/cupertino.dart';
import 'package:shopping_card/Product/Product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> itemList = [];

  void add(Product product){
    itemList.add(product);
    notifyListeners();
  }

  void remove(Product product){
    itemList.remove(product);
    notifyListeners();
  }

}
