import 'package:flutter/material.dart';
import 'package:learn_provider/View/checkout.dart';
import 'package:learn_provider/View/home.dart';
import 'package:learn_provider/models/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => HomePage(),
          '/checkout': (context) => const Checkout(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
