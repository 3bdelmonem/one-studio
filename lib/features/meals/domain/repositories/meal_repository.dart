import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

abstract class MealRepository {
  Future<Either<Failure, List<Meal>>> getMeals();
  Future<Either<Failure, Meal?>> getMealById(String id);
  Future<Either<Failure, List<Meal>>> searchMeals(String query);
}