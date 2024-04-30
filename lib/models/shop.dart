import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.999,
      description: "Item Description ... more description",
      imagePath: 'assets/ayakkabi.jpg'
    ),
    Product(
      name: "Product 2",
      price: 59.90,
      description: "Item Description",
      imagePath: 'assets/elbise.jpg'
    ),
    Product(
      name: "Product 3",
      price: 80.90,
      description: "Item Description",
      imagePath: 'assets/saat.jpg'
    ),
    Product(
      name: "Product 4",
      price: 99.999,
      description: "Item Description",
      imagePath: 'assets/tisort.jpg'
    )
  ];

  //user cart
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

  // get product list

  // add item to cart

  //remove item from cart
}
