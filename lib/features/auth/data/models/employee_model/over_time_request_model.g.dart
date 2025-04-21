// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_time_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OverTimeRequestModelAdapter extends TypeAdapter<OverTimeRequestModel> {
  @override
  final int typeId = 3;

  @override
  OverTimeRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OverTimeRequestModel(
      id: fields[0] as int?,
      type: fields[1] as String?,
      content: fields[2] as String?,
      rejectionReason: fields[3] as dynamic,
      status: fields[4] as String?,
      suggestion: fields[5] as String?,
      overTime: fields[6] as int?,
      overTimeDate: fields[7] as String?,
      overTimeStart: fields[8] as String?,
      overTimeEnd: fields[9] as String?,
      requestedBy: fields[10] as int?,
      requestedTo: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OverTimeRequestModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.rejectionReason)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.suggestion)
      ..writeByte(6)
      ..write(obj.overTime)
      ..writeByte(7)
      ..write(obj.overTimeDate)
      ..writeByte(8)
      ..write(obj.overTimeStart)
      ..writeByte(9)
      ..write(obj.overTimeEnd)
      ..writeByte(10)
      ..write(obj.requestedBy)
      ..writeByte(11)
      ..write(obj.requestedTo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverTimeRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
