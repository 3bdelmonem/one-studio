import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/cart/domain/repositories/cart_repository.dart';

class DeleteCartUseCase {
  final CartRepository cartRepository;

  DeleteCartUseCase({required this.cartRepository});

  Future<Either<Failure, String>> call() => cartRepository.deleteCart();
}
