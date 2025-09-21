import 'package:one_studio_task/features/cart/data/models/cart_model.dart';

abstract class Storage {
  // Language Storage
  Future<void> storeLang({required String langCode});
  String getLang();
  Future<void> deleteLang();

  // Cart Storage
  CartModel? getCart();
  Future<void> updateCart({required CartModel cart});
  Future<void> deleteCart();
}
