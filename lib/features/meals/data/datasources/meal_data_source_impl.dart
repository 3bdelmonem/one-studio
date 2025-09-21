import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:one_studio_task/features/meals/data/models/meal_model.dart';
import 'meal_data_source.dart';

class MealDataSourceImpl implements MealDataSource {
  @override
  Future<List<MealModel>> getMeals() async {
    String jsonString = await rootBundle.loadString('assets/json/meals.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<MealModel> meals = (jsonData['meals'] as List).map((meal) => MealModel.fromJson(meal)).toList();
    return meals;
  }

  @override
  Future<MealModel?> getMealById(String id) async {
    List<MealModel> meals = await getMeals();
    MealModel? meal = meals.where((meal) => meal.id == id).firstOrNull;
    return meal;
  }

  @override
  Future<List<MealModel>> searchMeals(String query) async {
    List<MealModel> meals = await getMeals();
    List<MealModel> filteredMeals = meals.where((meal) => meal.name.toLowerCase().contains(query.toLowerCase()) || meal.description.toLowerCase().contains(query.toLowerCase())).toList();
    return filteredMeals;
  }
}