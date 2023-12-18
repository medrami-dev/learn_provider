import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Learn Provider",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: const Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //? This is Just Like Provider.of<Class>(context, listen: false);
            Text(context.watch<Model>().name2),
            ElevatedButton(
                onPressed: () {
                  //? This is Just Like Provider.of<Class>(context, listen: true);
                  context.read<Model>().doSomthingTwo();
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: const Text(
                  "Do Somthing",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ]),
    );
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
