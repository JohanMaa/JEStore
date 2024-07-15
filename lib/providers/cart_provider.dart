// providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:eccomerce/models/item.dart';

class CartProvider with ChangeNotifier {
  Map<String, Item> _items = {};

  Map<String, Item> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price;
    });
    return total;
  }

  void addItem(String itemId, double price, String name, String imageUrl) {
    if (_items.containsKey(itemId)) {
      // Item sudah ada di keranjang
    } else {
      _items.putIfAbsent(
        itemId,
        () => Item(
          id: itemId,
          name: name,
          price: price,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    _items.remove(itemId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
