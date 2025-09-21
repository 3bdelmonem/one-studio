import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/core/error_handling/repository_helper.dart';
import 'package:one_studio_task/features/meals/data/datasources/meal_data_source.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/repositories/meal_repository.dart';


class MealRepositoryImpl with RepositoryHelper implements MealRepository {
  final MealDataSource _mealDataSource;
  MealRepositoryImpl(this._mealDataSource);

  @override
  Future<Either<Failure, List<Meal>>> getMeals() async {
    return await handleEither(() => _mealDataSource.getMeals());
  }

  @override
  Future<Either<Failure, Meal?>> getMealById(String id) async {
    return await handleEither(() => _mealDataSource.getMealById(id));
  }
  
  @override
  Future<Either<Failure, List<Meal>>> searchMeals(String query) async {
    return await handleEither(() => _mealDataSource.searchMeals(query));
  }
}
