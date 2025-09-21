import 'package:equatable/equatable.dart';
import 'option_value.dart';
import '../../data/models/meal_option_model.dart';

class MealOption extends Equatable{
  final String id;
  final String name;
  final bool isRequired;
  final bool isSingle;
  final bool isPriceDetermining;
  final OptionValue? singleSelectedOptionValue;
  final List<OptionValue> multiSelectedOptionValues;
  final List<OptionValue> values;

  const MealOption({
    required this.id,
    required this.name,
    required this.isRequired,
    required this.isSingle,
    required this.isPriceDetermining,
    required this.singleSelectedOptionValue,
    required this.multiSelectedOptionValues,
    required this.values,
  });
  
  MealOption copyWith({
    String? id,
    String? name,
    bool? isRequired,
    bool? isSingle,
    bool? isPriceDetermining,
    OptionValue? singleSelectedOptionValue,
    List<OptionValue>? multiSelectedOptionValues,
    List<OptionValue>? values,
  }) {
    return MealOption(
      id: id ?? this.id,
      name: name ?? this.name,
      isRequired: isRequired ?? this.isRequired,
      isSingle: isSingle ?? this.isSingle,
      isPriceDetermining: isPriceDetermining ?? this.isPriceDetermining,
      multiSelectedOptionValues: multiSelectedOptionValues ?? this.multiSelectedOptionValues,
      singleSelectedOptionValue: singleSelectedOptionValue,
      values: values ?? this.values,
    );
  }

  MealOptionModel toModel() {
    return MealOptionModel(
      id: id,
      name: name,
      isRequired: isRequired,
      isSingle: isSingle,
      isPriceDetermining: isPriceDetermining,
      singleSelectedOptionValue: singleSelectedOptionValue?.toModel(),
      multiSelectedOptionValues: multiSelectedOptionValues.map((value) => value.toModel()).toList(),
      values: values.map((value) => value.toModel()).toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    isRequired,
    isSingle,
    isPriceDetermining,
    singleSelectedOptionValue,
    multiSelectedOptionValues,
    values,
  ];  
}
