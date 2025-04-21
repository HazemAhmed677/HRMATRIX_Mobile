// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyInfoModelAdapter extends TypeAdapter<FamilyInfoModel> {
  @override
  final int typeId = 4;

  @override
  FamilyInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FamilyInfoModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      relation: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FamilyInfoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.relation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
