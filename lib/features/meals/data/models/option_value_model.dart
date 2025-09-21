import 'package:hive/hive.dart';

import '../../domain/entities/option_value.dart';

part 'option_value_model.g.dart';

@HiveType(typeId: 0)
class OptionValueModel extends OptionValue {
  @HiveField(0)
  final String _id;

  @HiveField(1)
  final String _name;

  @HiveField(2)
  final double _price;

  // Getters overriding OptionValue entity
  @override
  String get id => _id;

  @override
  String get name => _name;

  @override
  double get price => _price;

  const OptionValueModel({
    required super.id,
    required super.name,
    required super.price,
  }) : _id = id,
       _name = name,
       _price = price;

  factory OptionValueModel.fromJson(Map<String, dynamic> json) => OptionValueModel(
    id: json['id'] as String,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
  );

  OptionValueModel copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return OptionValueModel(
      id: id ?? _id,
      name: name ?? _name,
      price: price ?? _price,
    );
  }

  OptionValue toEntity() {
    return OptionValue(
      id: _id,
      name: _name,
      price: _price,
    );
  }
}
