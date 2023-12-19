import 'package:flutter/material.dart';
import 'package:learn_provider/models/cart.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var itemModel = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: itemModel.basketitem.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(itemModel.basketitem[index].name),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<Cart>()
                            .remove(itemModel.basketitem[index]);
                      },
                      icon: const Icon(Icons.remove)),
                ),
              );
            }));
  }
}
