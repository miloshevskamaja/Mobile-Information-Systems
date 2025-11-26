import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/meal-details", arguments: meal.id);
      },
      child: Card(
        shape: BeveledRectangleBorder(
          side: BorderSide(color: Colors.teal, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
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
    );
  }
}