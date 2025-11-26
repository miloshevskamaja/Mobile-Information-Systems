import 'package:flutter/material.dart';
import '/screens/details.dart';
import '/screens/meal_details.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      routes: {
        "/": (context) => const MyHomePage(title: 'Meals App'),
        "/home": (context) => const MyHomePage(title: 'Meals App'),
        "/details": (context) => const DetailsPage(),
        "/meal-details": (context) => const MealDetailsPage(),
      },
    );
  }
}