import 'package:flutter/material.dart';
import 'package:min/model/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "name1",
      price: 22.3,
      description: 'description',
      //imagePath: imagePath,
    ),
    Product(
      name: "name2",
      price: 22.3,
      description: 'description',
      //imagePath: imagePath,
    ),
    Product(
      name: "name3",
      price: 22.3,
      description: 'description',
      //imagePath: imagePath,
    ),
    Product(
      name: "name4",
      price: 22.3,
      description: 'description',
      //imagePath: imagePath,
    )
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
