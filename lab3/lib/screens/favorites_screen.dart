

import 'package:flutter/material.dart';
import 'package:lab2/services/favorites.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_card.dart';

class FavoritesScreen extends StatelessWidget{
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites recipes'),
      ),
      body: favorites.isEmpty
      ? const Center(child: Text('No favorites recipes yet'))
      : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: favorites.length,
        itemBuilder: (ctx, index){
          final meal = favorites[index];
          return MealCard(
            meal:meal
          );
        },
      ),
    );
  }


}