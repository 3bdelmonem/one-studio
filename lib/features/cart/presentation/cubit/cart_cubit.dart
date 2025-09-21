import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_task/features/cart/domain/entities/cart.dart';
import 'package:one_studio_task/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:one_studio_task/features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
    this._removeFromCartUseCase,
    this._updateCartItemUseCase,
    this._deleteCartUseCase,
  ) : super(CartInitial());

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCartUseCase();
    result.fold(
      (failure) => emit(GetCartError(message: failure.message)),
      (cart) => emit(GetCartLoaded(cart: cart)),
    );
  }

  Future<void> addToCart({required Meal meal}) async {
    emit(AddToCartLoading());
    final result = await _addToCartUseCase(meal: meal);
    result.fold(
      (failure) => emit(AddToCartError(message: failure.message)),
      (message) => emit(AddToCartSuccess(message: message)),
    );
  }

  Future<void> removeFromCart({required Meal meal}) async {
    emit(RemoveFromCartLoading());
    final result = await _removeFromCartUseCase(meal: meal);
    result.fold(
      (failure) => emit(RemoveFromCartError(message: failure.message)),
      (message) => emit(RemoveFromCartSuccess(message: message)),
    );
  }

  Future<void> updateCartItem({required Meal meal, required int index}) async {
    emit(UpdateCartItemLoading());
    final result = await _updateCartItemUseCase(meal: meal, index: index);
    result.fold(
      (failure) => emit(UpdateCartItemError(message: failure.message)),
      (message) => emit(UpdateCartItemSuccess(message: message)),
    );
  }

  Future<void> deleteCart() async {
    emit(DeleteCartLoading());
    final result = await _deleteCartUseCase();
    result.fold(
      (failure) => emit(DeleteCartError(message: failure.message)),
      (message) => emit(DeleteCartSuccess(message: message)),
    );
  }
}
