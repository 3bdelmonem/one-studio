import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/core/error_handling/repository_helper.dart';
import 'package:one_studio_task/features/cart/data/datasources/cart_data_source.dart';
import 'package:one_studio_task/features/cart/domain/entities/cart.dart';
import 'package:one_studio_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

class CartRepositoryImpl with RepositoryHelper implements CartRepository {
  final CartDataSource _cartDataSource;
  CartRepositoryImpl(this._cartDataSource);

  @override
  Future<Either<Failure, Cart>> getCart() async {
    return await handleEither(() async {
      final cartModel = await _cartDataSource.getCart();
      return cartModel?.toEntity() ?? const Cart(meals: []);
    });
  }

  @override
  Future<Either<Failure, String>> addToCart(Meal meal) async {
    return await handleEither(() => _cartDataSource.addToCart(meal.toModel()));
  }

  @override
  Future<Either<Failure, String>> removeFromCart(Meal meal) async {
    return await handleEither(() => _cartDataSource.removeFromCart(meal.toModel()));
  }

  @override
  Future<Either<Failure, String>> updateCartItem(Meal meal, int index) async {
    return await handleEither(() => _cartDataSource.updateCartItem(meal.toModel(), index));
  }

  @override
  Future<Either<Failure, String>> deleteCart() async {
    return await handleEither(() => _cartDataSource.deleteCart());
  }
}
