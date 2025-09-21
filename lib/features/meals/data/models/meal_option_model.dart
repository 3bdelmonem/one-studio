import 'package:hive/hive.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'option_value_model.dart';

part 'meal_option_model.g.dart';

@HiveType(typeId: 1)
class MealOptionModel extends MealOption {
  @HiveField(0)
  final String _id;

  @HiveField(1)
  final String _name;

  @HiveField(2)
  final bool _isRequired;

  @HiveField(3)
  final bool _isSingle;

  @HiveField(4)
  final bool _isPriceDetermining;

  @HiveField(5)
  final List<OptionValueModel> _values;

  @HiveField(6)
  final OptionValueModel? _singleSelectedOptionValue;

  @HiveField(7)
  final List<OptionValueModel> _multiSelectedOptionValues;

  // Getters overriding MealOption entity
  @override
  String get id => _id;

  @override
  String get name => _name;

  @override
  bool get isRequired => _isRequired;

  @override
  bool get isSingle => _isSingle;

  @override
  bool get isPriceDetermining => _isPriceDetermining;

  @override
  List<OptionValueModel> get values => _values;

  @override
  OptionValueModel? get singleSelectedOptionValue => _singleSelectedOptionValue;

  @override
  List<OptionValueModel> get multiSelectedOptionValues => _multiSelectedOptionValues;

  const MealOptionModel({
    required super.id,
    required super.name,
    required super.isRequired,
    required super.isSingle,
    required super.isPriceDetermining,
    required OptionValueModel? super.singleSelectedOptionValue,
    required List<OptionValueModel> super.multiSelectedOptionValues,
    required List<OptionValueModel> super.values,
  }) : _id = id,
       _name = name,
       _isRequired = isRequired,
       _isSingle = isSingle,
       _isPriceDetermining = isPriceDetermining,
       _values = values,
       _singleSelectedOptionValue = singleSelectedOptionValue,
       _multiSelectedOptionValues = multiSelectedOptionValues;

  factory MealOptionModel.fromJson(Map<String, dynamic> json) => MealOptionModel(
    id: json['id'] as String,
    name: json['name'] as String,
    isRequired: json['is_required'] as bool,
    isSingle: json['is_single'] as bool,
    isPriceDetermining: json['is_price_determining'] as bool,
    singleSelectedOptionValue: json['single_selected_option_value'] != null ? OptionValueModel.fromJson(json['single_selected_option_value']) : null,
    multiSelectedOptionValues: json['multi_selected_option_values'] != null ? (json['multi_selected_option_values'] as List).map((value) => OptionValueModel.fromJson(value)).toList() : [],
    values: (json['values'] as List).map((value) => OptionValueModel.fromJson(value)).toList(),
  );

  MealOption toEntity() {
    return MealOption(
      id: _id,
      name: _name,
      isRequired: _isRequired,
      isSingle: _isSingle,
      isPriceDetermining: _isPriceDetermining,
      singleSelectedOptionValue: _singleSelectedOptionValue?.toEntity(),
      multiSelectedOptionValues: _multiSelectedOptionValues.map((value) => value.toEntity()).toList(),
      values: _values.map((value) => value.toEntity()).toList(),
    );
  }
}
