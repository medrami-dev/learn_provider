import 'package:flutter/material.dart';
import '../models/item.dart';

class Cart extends ChangeNotifier {
  final List<Item> _items = [];
  double _price = 0;
  void add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Item> get basketitem {
    return _items;
  }

  void remove(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }
}
