import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/repositories/meal_repository.dart';

class SearchMealsUseCase {
  final MealRepository mealRepository;

  SearchMealsUseCase({required this.mealRepository});

  Future<Either<Failure, List<Meal>>> call({required String query}) => mealRepository.searchMeals(query);
}
