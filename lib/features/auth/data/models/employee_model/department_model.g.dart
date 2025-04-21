// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartmentModelAdapter extends TypeAdapter<DepartmentModel> {
  @override
  final int typeId = 1;

  @override
  DepartmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepartmentModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      type: fields[2] as String?,
      parentId: fields[3] as dynamic,
      hodId: fields[4] as int?,
      directorId: fields[5] as dynamic,
      companyId: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DepartmentModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.parentId)
      ..writeByte(4)
      ..write(obj.hodId)
      ..writeByte(5)
      ..write(obj.directorId)
      ..writeByte(6)
      ..write(obj.companyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
