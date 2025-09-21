import 'package:equatable/equatable.dart';

import '../../../meals/domain/entities/meal.dart';
import '../../data/models/cart_model.dart';

class Cart extends Equatable {
  final List<Meal> meals;

  const Cart({
    required this.meals,
  });

  Cart copyWith({
    List<Meal>? meals,
  }) {
    return Cart(
      meals: meals ?? this.meals,
    );
  }

  CartModel toModel() {
    return CartModel(
      meals: meals.map((meal) => meal.toModel()).toList(),
    );
  }

  @override
  List<Object?> get props => [meals];
}
