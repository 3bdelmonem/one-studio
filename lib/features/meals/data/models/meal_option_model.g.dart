// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_option_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealOptionModelAdapter extends TypeAdapter<MealOptionModel> {
  @override
  final int typeId = 1;

  @override
  MealOptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealOptionModel(
      id: fields[0] as String,
      name: fields[1] as String,
      isRequired: fields[2] as bool,
      isSingle: fields[3] as bool,
      isPriceDetermining: fields[4] as bool,
      values: (fields[5] as List).cast<OptionValueModel>(),
      singleSelectedOptionValue: fields[6] as OptionValueModel?,
      multiSelectedOptionValues: (fields[7] as List).cast<OptionValueModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealOptionModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._isRequired)
      ..writeByte(3)
      ..write(obj._isSingle)
      ..writeByte(4)
      ..write(obj._isPriceDetermining)
      ..writeByte(5)
      ..write(obj._values)
      ..writeByte(6)
      ..write(obj._singleSelectedOptionValue)
      ..writeByte(7)
      ..write(obj._multiSelectedOptionValues);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealOptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
