import 'package:get_it/get_it.dart';
import 'package:one_studio_task/features/cart/data/datasources/cart_data_source.dart';
import 'package:one_studio_task/features/cart/data/datasources/cart_data_source_impl.dart';
import 'package:one_studio_task/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:one_studio_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:one_studio_task/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';

Future<void> initCartInjection(GetIt sl) async {
  //* Blocs
  sl.registerFactory<CartCubit>(() => CartCubit(sl(), sl(), sl(), sl(), sl())); 

  //* UseCase
  sl.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<RemoveFromCartUseCase>(() => RemoveFromCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<UpdateCartItemUseCase>(() => UpdateCartItemUseCase(cartRepository: sl()));
  sl.registerLazySingleton<DeleteCartUseCase>(() => DeleteCartUseCase(cartRepository: sl()));

  //* Repositries
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));

  //* Datasources
  sl.registerLazySingleton<CartDataSource>(() => CartDataSourceImpl(storage: sl()));
}
