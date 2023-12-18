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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Selector<Model, int>(
              selector: (context, value) => value.getshowOne,
              builder: (context, crt1, child) {
                return Text(crt1.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 19));
              },
            ),
            Consumer<Model>(
              builder: (context, numOne, child) {
                return ElevatedButton(
                    onPressed: () {
                      numOne.doSomthingOne();
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    child: const Text(
                      "Do Somthing  1",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ));
              },
            ),
            const SizedBox(
              height: 60,
            ),
            // ? Text
            Selector<Model, String>(
              selector: (context, value) => value.getshowTwo,
              builder: (context, crt2, child) {
                return Text(crt2,
                    style: const TextStyle(color: Colors.black, fontSize: 19));
              },
            ),

            // ? button
            Consumer<Model>(builder: (context, nameTwo, widget) {
              return ElevatedButton(
                  onPressed: () {
                    nameTwo.doSomthingTwo();
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: const Text(
                    "Do Somthing 2",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ));
            })
          ]),
        ));
  }
}

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
