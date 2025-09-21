import 'package:hive/hive.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'meal_option_model.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 2)
class MealModel extends Meal {
  @HiveField(0)
  final String _id;

  @HiveField(1)
  final String _name;

  @HiveField(2)
  final String _description;

  @HiveField(3)
  final String _imageUrl;

  @HiveField(4)
  final double _price;

  @HiveField(5)
  final double? _priceBeforeDiscount;

  @HiveField(6)
  final List<MealOptionModel> _options;

  @HiveField(7)
  final int _quantity;

  @HiveField(8)
  final double? _totalPrice;

  // Getters overriding Meal entity
  @override
  String get id => _id;

  @override
  String get name => _name;

  @override
  String get description => _description;

  @override
  String get imageUrl => _imageUrl;

  @override
  double get price => _price;

  @override
  double? get priceBeforeDiscount => _priceBeforeDiscount;

  @override
  int get quantity => _quantity;

  @override
  double? get totalPrice => _totalPrice;

  @override
  List<MealOptionModel> get options => _options;

  const MealModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.priceBeforeDiscount,
    required List<MealOptionModel> super.options,
    required super.quantity,
    required super.totalPrice,
  }) : _id = id,
       _name = name,
       _description = description,
       _imageUrl = imageUrl,
       _price = price,
       _priceBeforeDiscount = priceBeforeDiscount,
       _options = options,
       _quantity = quantity,
       _totalPrice = totalPrice;

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['image_url'] as String,
    price: (json['price'] as num).toDouble(),
    priceBeforeDiscount: json['price_before_discount'] != null ? (json['price_before_discount'] as num).toDouble() : null,
    options: (json['options'] as List).map((option) => MealOptionModel.fromJson(option as Map<String, dynamic>)).toList(),
    quantity: (json['quantity'] ?? 1) as int,
    totalPrice: json['total_price'] != null ? (json['total_price'] as num).toDouble() : null,
  );

  @override
  MealModel copyWith({
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
    return MealModel(
      id: id ?? _id,
      name: name ?? _name,
      description: description ?? _description,
      imageUrl: imageUrl ?? _imageUrl,
      price: price ?? _price,
      priceBeforeDiscount: priceBeforeDiscount ?? _priceBeforeDiscount,
      options: options != null ? options.map((option) => option.toModel()).toList() : _options,
      quantity: quantity ?? _quantity,
      totalPrice: totalPrice ?? _totalPrice,
    );
  }

  Meal toEntity() {
    return Meal(
      id: _id,
      name: _name,
      description: _description,
      imageUrl: _imageUrl,
      price: _price,
      priceBeforeDiscount: _priceBeforeDiscount,
      options: _options.map((option) => option.toEntity()).toList(),
      quantity: _quantity,
      totalPrice: _totalPrice,
    );
  }
}
