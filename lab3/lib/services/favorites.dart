

import 'package:flutter/cupertino.dart';

import '../models/meal.dart';

class FavoritesProvider extends ChangeNotifier{
  final List<Meal> _favorites = [];

  List<Meal> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(int id){
    return _favorites.any((m)=>m.id ==id);
  }

  void toggleFavorite(Meal meal){
    final existsIndex =
        _favorites.indexWhere((m)=> m.id == meal.id);

    if(existsIndex >=0){
      _favorites.removeAt(existsIndex);
    } else{
      _favorites.add(meal);
    }
    notifyListeners();
  }
}