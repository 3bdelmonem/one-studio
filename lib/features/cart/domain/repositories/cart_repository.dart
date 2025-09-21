import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/cart/domain/entities/cart.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, String>> addToCart(Meal meal);
  Future<Either<Failure, String>> removeFromCart(Meal meal);
  Future<Either<Failure, String>> updateCartItem(Meal meal, int index);
  Future<Either<Failure, String>> deleteCart();
}
