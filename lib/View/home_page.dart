import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Learn Provider",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Selector<Model, String>(
                    selector: (context, p1) => p1.getshowTwo,
                    builder: (context, model, child) {
                      return Text(model);
                    }),
                Consumer<ProveOne>(builder: (context, model, child) {
                  return Text(model.state);
                }),
                Consumer<Model>(builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        value.doSomthingTwo();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      child: const Text(
                        "Do Somthing",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ));
                }),
                Consumer<ProveOne>(builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        value.doSomthingOne();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      child: const Text(
                        "Do Somthing",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ));
                }),
              ]),
        ));
  }
}

// * This is Model Class
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
