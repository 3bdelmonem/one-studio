part of 'meal_cubit.dart';

sealed class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

final class MealInitial extends MealState {}

final class GetMealsLoading extends MealState {}

final class GetMealsLoaded extends MealState {
  final List<Meal> meals;
  const GetMealsLoaded({required this.meals});
}

final class GetMealsError extends MealState {
  final String message;
  const GetMealsError({required this.message});
}

final class GetMealByIdLoading extends MealState {}

final class GetMealByIdLoaded extends MealState {
  final Meal? meal;
  const GetMealByIdLoaded({required this.meal});
}

final class GetMealByIdError extends MealState {
  final String message;
  const GetMealByIdError({required this.message});
}

final class SearchMealsLoading extends MealState {}

final class EmptySearchMeals extends MealState {}

final class SearchMealsError extends MealState {
  final String message;
  const SearchMealsError({required this.message});
}