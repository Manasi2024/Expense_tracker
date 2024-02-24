import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create  : (context) => ExpenseData(),
    builder: (context, child ) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    ),
    );
  }

//   Widget build(BuildContext context) {
//     return Provider<ExpenseData>(
//         create: (_) => ExpenseData(),
//         // we use `builder` to obtain a new `BuildContext` that has access to the provider
//         builder: (context, child) {
//           // No longer throws
//           return Text(context.watch<ExpenseData>().toString());
//         }
//     );
//   }
}


