import 'package:one_studio_task/features/meals/data/models/meal_model.dart';

abstract class MealDataSource {
  Future<List<MealModel>> getMeals();
  Future<MealModel?> getMealById(String id);
  Future<List<MealModel>> searchMeals(String query);
}