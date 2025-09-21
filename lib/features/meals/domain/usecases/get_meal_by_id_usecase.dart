import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/repositories/meal_repository.dart';

class GetMealByIdUseCase {
  final MealRepository mealRepository;

  GetMealByIdUseCase({required this.mealRepository});

  Future<Either<Failure, Meal?>> call({required String id}) => mealRepository.getMealById(id);
}
