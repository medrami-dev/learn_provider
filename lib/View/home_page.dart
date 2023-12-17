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
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Consumer<Model>(
            builder: (context, value, child) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(value.name),
                      ElevatedButton(
                          onPressed: () {
                            value.changeName();
                          },
                          child: const Text("Do Somthing"))
                    ]),
              );
            },
          ),
        ));
  }
}

class Model extends ChangeNotifier {
  String name = "Mohamed";
  changeName() {
    name = "ali";
    notifyListeners();
  }
}
