import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/cart/domain/entities/cart.dart';
import 'package:one_studio_task/features/cart/domain/repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<Either<Failure, Cart>> call() => cartRepository.getCart();
}
