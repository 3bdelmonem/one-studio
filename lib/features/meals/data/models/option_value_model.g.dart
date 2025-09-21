// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_value_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionValueModelAdapter extends TypeAdapter<OptionValueModel> {
  @override
  final int typeId = 0;

  @override
  OptionValueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionValueModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OptionValueModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionValueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
