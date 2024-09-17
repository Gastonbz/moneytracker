import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/transactions_provider.dart';
import 'components/widgets/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
