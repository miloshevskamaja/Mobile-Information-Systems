import 'package:flutter/material.dart';
import 'package:lab2/services/favorites.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;



  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context);
    final isFav = favorites.isFavorite(meal.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/meal-details", arguments: meal.id);
        },
      child: Stack(
        children: [
          Card(
            shape: BeveledRectangleBorder(
              side: BorderSide(color: Colors.teal, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Positioned(
                    top:3,
                    right: 6,
                    child: IconButton(
                      icon:Icon(
                        isFav? Icons.favorite : Icons.favorite_border,
                        color: isFav? Colors.red : Colors.teal,
                      ),
                      onPressed: () {
                        favorites.toggleFavorite(meal);
                      },
                    ),
                  ),
                  Expanded(child: Image.network(meal.image)),
                  Text(
                    meal.name,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}