import 'package:one_studio_task/core/navigation/navigation_inj.dart';
import 'package:one_studio_task/core/storage/storage_inj.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_task/features/cart/cart_inj.dart';
import 'package:one_studio_task/features/meals/meals_inj.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await initStorageInjection(sl);
  initNavigationInjection(sl);
  initMealsInjection(sl);
  initCartInjection(sl);
}
