import 'package:flutter/material.dart';
import 'package:mis_lab/screens/details.dart';
import 'package:mis_lab/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyIndexPage(title: "Schedule for exams - 221095"),
        "/details" :(context)=> const DetailsPage(),
      },
    );
  }
}


