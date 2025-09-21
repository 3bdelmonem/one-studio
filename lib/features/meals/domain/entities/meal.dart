import 'package:equatable/equatable.dart';

import 'meal_option.dart';
import '../../data/models/meal_model.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double? priceBeforeDiscount;
  final List<MealOption> options;
  final int quantity;
  final double? totalPrice;

  const Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.priceBeforeDiscount,
    required this.options,
    required this.quantity,
    required this.totalPrice,
  });

  Meal copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
    double? priceBeforeDiscount,
    List<MealOption>? options,
    int? quantity,
    double? totalPrice,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
      options: options ?? this.options,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice,
    );
  }

  MealModel toModel() {
    return MealModel(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
      priceBeforeDiscount: priceBeforeDiscount,
      options: options.map((option) => option.toModel()).toList(),
      quantity: quantity,
      totalPrice: totalPrice,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    price,
    priceBeforeDiscount,
    options,
    quantity,
    totalPrice,
  ];
}
