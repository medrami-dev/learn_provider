import 'package:flutter/material.dart';
import 'package:learn_provider/models/cart.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Item> items = [
    Item(name: 'Iphone 15 Pro Max', price: 1500),
    Item(name: 'Macbook M3 ', price: 2500),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.black,
                      )),
                  Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text('${cart.totalPrice} \$');
                    },
                  ),
                ],
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            "Learn Provider",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return ListTile(
                      title: Text(items[index].name),
                      trailing: IconButton(
                          onPressed: () {
                            cart.add(items[index]);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Color.fromARGB(255, 8, 33, 45),
                          )),
                    );
                  },
                ),
              );
            }));
  }
}
