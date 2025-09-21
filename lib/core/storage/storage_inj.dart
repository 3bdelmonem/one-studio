import 'package:get_it/get_it.dart';
import 'package:one_studio_task/core/storage/data/storage.dart';
import 'package:one_studio_task/core/storage/data/storage_impl.dart';
import 'package:one_studio_task/features/cart/data/models/cart_model.dart';
import 'package:one_studio_task/features/meals/data/models/meal_model.dart';
import 'package:one_studio_task/features/meals/data/models/meal_option_model.dart';
import 'package:one_studio_task/features/meals/data/models/option_value_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';


Future<void> initStorageInjection(GetIt sl) async {
  //! Get App Directory and Init Hive
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  //! Register Models
  Hive.registerAdapter(MealModelAdapter());
  Hive.registerAdapter(MealOptionModelAdapter());
  Hive.registerAdapter(OptionValueModelAdapter());
  Hive.registerAdapter(CartModelAdapter());

  //! Open Boxes
  Box<String> stringBox = await Hive.openBox<String>('stringBox');
  Box<bool> boolBox = await Hive.openBox<bool>('boolBox');
  Box<CartModel> cartBox = await Hive.openBox<CartModel>('cartBox');

  //! Injection
  sl.registerLazySingleton<Box<String>>(() => stringBox);
  sl.registerLazySingleton<Box<bool>>(() => boolBox);
  sl.registerLazySingleton<Box<CartModel>>(() => cartBox);


  sl.registerFactory<Storage>(() => StorageImpl(stringBox: sl(), boolBox: sl(), cartBox: sl()));
}