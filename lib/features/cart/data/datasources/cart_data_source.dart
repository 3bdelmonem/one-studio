import 'package:one_studio_task/features/cart/data/models/cart_model.dart';
import 'package:one_studio_task/features/meals/data/models/meal_model.dart';

abstract class CartDataSource {
  Future<CartModel?> getCart();
  Future<String> addToCart(MealModel meal);
  Future<String> updateCartItem(MealModel meal, int index);
  Future<String> removeFromCart(MealModel meal);
  Future<String> deleteCart();
}