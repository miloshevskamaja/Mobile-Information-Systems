import 'package:flutter/material.dart';
import 'package:lab2/screens/favorites_screen.dart';
import 'package:lab2/services/favorites.dart';
import 'package:provider/provider.dart';
import '/screens/details.dart';
import '/screens/meal_details.dart';

import 'screens/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint("BG message: ${message.messageId} data=${message.data}");
}


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  await FirebaseMessaging.instance.requestPermission();
  final token = await FirebaseMessaging.instance.getToken();
  debugPrint("FCM TOKEN: $token");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint("FG message: ${message.messageId}");
    debugPrint("title=${message.notification?.title} body=${message.notification?.body}");
    debugPrint("data=${message.data}");
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint("Opened from notification: ${message.messageId}");
  });

  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
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
        "/favorites":(context)=>const FavoritesScreen(),
      },
    );
  }
}