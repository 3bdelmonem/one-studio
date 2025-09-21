part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartLoaded extends CartState {
  final Cart cart;

  const GetCartLoaded({required this.cart});

  @override
  List<Object?> get props => [cart];
}

class GetCartError extends CartState {
  final String message;

  const GetCartError({required this.message});

  @override
  List<Object?> get props => [message];
}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final String message;
  const AddToCartSuccess({required this.message});
  @override
  List<Object?> get props => [message,];
}

class AddToCartError extends CartState {
  final String message;
  const AddToCartError({required this.message});
  @override
  List<Object?> get props => [message];
}

class RemoveFromCartLoading extends CartState {}

class RemoveFromCartSuccess extends CartState {
  final String message;
  const RemoveFromCartSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class RemoveFromCartError extends CartState {
  final String message;
  const RemoveFromCartError({required this.message});
  @override
  List<Object?> get props => [message];
}

class UpdateCartItemLoading extends CartState {}

class UpdateCartItemSuccess extends CartState {
  final String message;
  const UpdateCartItemSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateCartItemError extends CartState {
  final String message;

  const UpdateCartItemError({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeleteCartLoading extends CartState {}

class DeleteCartSuccess extends CartState {
  final String message;

  const DeleteCartSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeleteCartError extends CartState {
  final String message;

  const DeleteCartError({required this.message});

  @override
  List<Object?> get props => [message];
}
