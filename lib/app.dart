import 'package:flutter/material.dart';
import 'screen/homepage/homepage.dart';

class MealApp extends StatelessWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Meal App',
        theme: ThemeData(primaryColor: Colors.amber[300]),
        home: const HomePage());
  }
}
