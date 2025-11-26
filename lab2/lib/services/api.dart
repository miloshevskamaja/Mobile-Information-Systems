import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/meal.dart';
import '../models/meal_detail.dart';

class Api{
  Future<List<Category>> loadCategoryList({required int n}) async{
    final response = await http.get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php")
    );

    if(response.statusCode ==200){
      final data = json.decode(response.body);
      final List categories = data["categories"];
      return categories.take(n).map((item)=>Category.fromJson(item)).toList();
    } else{
      throw Exception("Failed to load categories");
    }
  }

  Future<Category?> searchCategoryByName(String name) async{
    try{
      final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List categories = data['categories'] ?? [];

        final lower = name.toLowerCase();
        for (final item in categories) {
          final catName = (item['strCategory'] ?? '').toString().toLowerCase();
          if (catName == lower) {
            return Category.fromJson(item as Map<String, dynamic>);
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Meal>> loadMealList({required String name}) async{
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$name'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List categories = data["meals"];
      return categories.map((item) => Meal.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }


  Future<Meal?> searchMealByName(String name) async {
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$name'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List categories = data['meals'] ?? [];

        final lower = name.toLowerCase();
        for (final item in categories) {
          final catName = (item['strMeal'] ?? '').toString().toLowerCase();
          if (catName == lower) {
            return Meal.fromJson(item as Map<String, dynamic>);
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<MealDetailModel?> getMealDetailById(String id) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'];
      if (meals != null && meals.isNotEmpty) {
        return MealDetailModel.fromJson(meals[0]);
      }
    }
    return null;
  }

  Future<MealDetailModel?> getRandomMeal() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data["meals"];
      if (meals != null && meals.isNotEmpty) {
        return MealDetailModel.fromJson(meals[0]);
      }
    }
    return null;
  }
}