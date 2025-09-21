import 'package:one_studio_task/core/config/env_keys.dart';
import 'package:one_studio_task/core/extensions/env.dart';
import 'package:one_studio_task/core/storage/data/storage.dart';
import 'package:hive/hive.dart';
import 'package:one_studio_task/features/cart/data/models/cart_model.dart';

class StorageImpl implements Storage {
  final Box<String> stringBox;
  final Box<bool> boolBox;
  final Box<CartModel> cartBox;

  static final String _language = EnvKeys.language.env;
  static final String _cart = EnvKeys.cart.env;

  StorageImpl({
    required this.stringBox,
    required this.boolBox,
    required this.cartBox,
  });

  //* language storage
  @override
  Future<void> storeLang({required String langCode}) async {
    await stringBox.put(_language, langCode);
  }

  @override
  String getLang() {
    return stringBox.get(_language) ?? "en";
  }

  @override
  Future<void> deleteLang() async {
    await stringBox.delete(_language);
  }

  // Cart Storage
  @override
  CartModel? getCart() {
    final cart = cartBox.get(_cart);
    return cart;
  }

  @override
  Future<void> updateCart({required CartModel cart}) async {await cartBox.put(_cart, cart);}

  @override
  Future<void> deleteCart() async {await cartBox.delete(_cart);}
}