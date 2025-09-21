// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealModelAdapter extends TypeAdapter<MealModel> {
  @override
  final int typeId = 2;

  @override
  MealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      imageUrl: fields[3] as String,
      price: fields[4] as double,
      priceBeforeDiscount: fields[5] as double?,
      options: (fields[6] as List).cast<MealOptionModel>(),
      quantity: fields[7] as int,
      totalPrice: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._description)
      ..writeByte(3)
      ..write(obj._imageUrl)
      ..writeByte(4)
      ..write(obj._price)
      ..writeByte(5)
      ..write(obj._priceBeforeDiscount)
      ..writeByte(6)
      ..write(obj._options)
      ..writeByte(7)
      ..write(obj._quantity)
      ..writeByte(8)
      ..write(obj._totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
