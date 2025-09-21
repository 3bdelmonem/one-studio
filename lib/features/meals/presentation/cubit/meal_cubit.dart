import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:one_studio_task/features/meals/domain/usecases/get_meals_usecase.dart';
import 'package:one_studio_task/features/meals/domain/usecases/search_meals_usecase.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final GetMealsUseCase _getMealsUseCase;
  final SearchMealsUseCase _searchMealsUseCase;
  final GetMealByIdUseCase _getMealByIdUseCase;

  MealCubit(
    this._getMealsUseCase,
    this._searchMealsUseCase,
    this._getMealByIdUseCase,
  ) : super(MealInitial());

  Future<void> getMeals() async {
    emit(GetMealsLoading());
    final result = await _getMealsUseCase();
    result.fold(
      (failure) => emit(GetMealsError(message: failure.message)),
      (meals) => emit(GetMealsLoaded(meals: meals)),
    );
  }

  Future<void> searchMeals({required String query}) async {
    emit(SearchMealsLoading());
    final result = await _searchMealsUseCase(query: query);
    result.fold(
      (failure) => emit(SearchMealsError(message: failure.message)),
      (meals) => meals.isEmpty ? emit(EmptySearchMeals()) : emit(GetMealsLoaded(meals: meals)),
    );
  }

  Future<void> getMealById(String id) async {
    emit(GetMealByIdLoading());
    final result = await _getMealByIdUseCase(id: id);
    result.fold(
      (failure) => emit(GetMealByIdError(message: failure.message)),
      (meal) => emit(GetMealByIdLoaded(meal: meal)),
    );
  }
}
