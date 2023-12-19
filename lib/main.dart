import 'package:flutter/material.dart';
import 'package:learn_provider/View/home_page.dart';
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
        ChangeNotifierProvider(create: (context) => Model()),
        ChangeNotifierProvider(create: (context) => ProveOne()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
