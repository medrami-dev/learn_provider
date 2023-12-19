// * This is Model Class
import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  var name1 = 0;
  var name2 = "Amin";

  get getshowOne => name1;
  get getshowTwo => name2;

  doSomthingOne() {
    name1++;
    notifyListeners();
  }

  doSomthingTwo() {
    name2 = "Mohamed 🤍";
    notifyListeners();
  }
}

class ProveOne extends ChangeNotifier {
  var state = "Oran";

  get getshowOne => state;

  doSomthingOne() {
    state = "Alger";
    notifyListeners();
  }
}
