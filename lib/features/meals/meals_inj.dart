import 'package:get_it/get_it.dart';
import 'package:one_studio_task/features/meals/data/datasources/meal_data_source.dart';
import 'package:one_studio_task/features/meals/data/datasources/meal_data_source_impl.dart';
import 'package:one_studio_task/features/meals/data/repositories/meal_repository_impl.dart';
import 'package:one_studio_task/features/meals/domain/repositories/meal_repository.dart';
import 'package:one_studio_task/features/meals/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:one_studio_task/features/meals/domain/usecases/get_meals_usecase.dart';
import 'package:one_studio_task/features/meals/domain/usecases/search_meals_usecase.dart';
import 'package:one_studio_task/features/meals/presentation/cubit/meal_cubit.dart';

Future<void> initMealsInjection(GetIt sl) async {
  //* Blocs
  sl.registerFactory<MealCubit>(() => MealCubit(sl(), sl(), sl())); 

  //* UseCase
  sl.registerLazySingleton<GetMealsUseCase>(() => GetMealsUseCase(mealRepository: sl()));
  sl.registerLazySingleton<GetMealByIdUseCase>(() => GetMealByIdUseCase(mealRepository: sl()));
  sl.registerLazySingleton<SearchMealsUseCase>(() => SearchMealsUseCase(mealRepository: sl()));

  //* Repositries
  sl.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(sl()));

  //* Datasources
  sl.registerLazySingleton<MealDataSource>(() => MealDataSourceImpl());
}