import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';
import 'package:one_studio_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

class RemoveFromCartUseCase {
  final CartRepository cartRepository;

  RemoveFromCartUseCase({required this.cartRepository});

  Future<Either<Failure, String>> call({required Meal meal}) => cartRepository.removeFromCart(meal);
}
