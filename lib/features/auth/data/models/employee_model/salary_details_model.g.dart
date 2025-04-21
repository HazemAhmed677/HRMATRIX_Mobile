// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalaryDetailsModelAdapter extends TypeAdapter<SalaryDetailsModel> {
  @override
  final int typeId = 2;

  @override
  SalaryDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalaryDetailsModel(
      id: fields[0] as int?,
      baseSalary: fields[1] as String?,
      housingAllowance: fields[2] as String?,
      transportationAllowance: fields[3] as String?,
      otherAllowance: fields[4] as String?,
      gosi: fields[5] as String?,
      salaryOnGosi: fields[6] as String?,
      financialTransaction: fields[7] as int?,
      totalSalary: fields[8] as int?,
      netSalary: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SalaryDetailsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.baseSalary)
      ..writeByte(2)
      ..write(obj.housingAllowance)
      ..writeByte(3)
      ..write(obj.transportationAllowance)
      ..writeByte(4)
      ..write(obj.otherAllowance)
      ..writeByte(5)
      ..write(obj.gosi)
      ..writeByte(6)
      ..write(obj.salaryOnGosi)
      ..writeByte(7)
      ..write(obj.financialTransaction)
      ..writeByte(8)
      ..write(obj.totalSalary)
      ..writeByte(9)
      ..write(obj.netSalary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalaryDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
