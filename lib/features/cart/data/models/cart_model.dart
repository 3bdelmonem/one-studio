import 'package:hive/hive.dart';
import 'package:one_studio_task/features/cart/domain/entities/cart.dart';
import '../../../meals/data/models/meal_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 3)
class CartModel extends Cart {
  @HiveField(0)
  final List<MealModel> _meals;

  @override
  List<MealModel> get meals => _meals;

  const CartModel({
    required List<MealModel> super.meals,
  }) : _meals = meals;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    meals: json['meals'] != null ? (json['meals'] as List).map((meal) => MealModel.fromJson(meal)).toList() : [],
  );

  Cart toEntity() {
    return Cart(
      meals: _meals.map((meal) => meal.toEntity()).toList(),
    );
  }
}
