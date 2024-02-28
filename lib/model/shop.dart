import 'package:flutter/material.dart';
import 'package:min/model/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "name1",
      price: 22.3,
      description: 'description',
      imagePath: 'assets/hoodies.jpg',
    ),
    Product(
      name: "name2",
      price: 22.3,
      description: 'description',
      imagePath: 'assets/watch.jpeg',
    ),
    Product(
      name: "name3",
      price: 22.3,
      description: 'description',
      imagePath: 'assets/shoe.jpg',
    ),
    Product(
      name: "name4",
      price: 22.3,
      description: 'description',
      imagePath: 'assets/shirt.jpg',
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
