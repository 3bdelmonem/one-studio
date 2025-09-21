import 'package:equatable/equatable.dart';
import '../../data/models/option_value_model.dart';

class OptionValue extends Equatable{
  final String id;
  final String name;
  final double price;

  const OptionValue({
    required this.id,
    required this.name,
    required this.price,
  });
  
  OptionValueModel toModel() {
    return OptionValueModel(
      id: id,
      name: name,
      price: price,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    price,
  ];
}
