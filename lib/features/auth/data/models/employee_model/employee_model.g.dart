// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelAdapter extends TypeAdapter<EmployeeModel> {
  @override
  final int typeId = 0;

  @override
  EmployeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      secondaryPhoneNumber: fields[4] as dynamic,
      birthDate: fields[5] as String?,
      gender: fields[6] as String?,
      shift: fields[7] as String?,
      maritalStatus: fields[8] as String?,
      nationality: fields[9] as String?,
      nationalId: fields[10] as String?,
      citizen: fields[11] as String?,
      religion: fields[12] as String?,
      dateOfJoining: fields[13] as String?,
      endOfProbation: fields[14] as String?,
      role: fields[15] as String?,
      bankAccountNumber: fields[16] as dynamic,
      bankAccountStatus: fields[17] as String?,
      jobType: fields[18] as String?,
      jobTitle: fields[19] as String?,
      baseSalary: fields[20] as String?,
      departmentId: fields[21] as int?,
      address: fields[22] as String?,
      avatar: fields[23] as dynamic,
      branch: fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.secondaryPhoneNumber)
      ..writeByte(5)
      ..write(obj.birthDate)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.shift)
      ..writeByte(8)
      ..write(obj.maritalStatus)
      ..writeByte(9)
      ..write(obj.nationality)
      ..writeByte(10)
      ..write(obj.nationalId)
      ..writeByte(11)
      ..write(obj.citizen)
      ..writeByte(12)
      ..write(obj.religion)
      ..writeByte(13)
      ..write(obj.dateOfJoining)
      ..writeByte(14)
      ..write(obj.endOfProbation)
      ..writeByte(15)
      ..write(obj.role)
      ..writeByte(16)
      ..write(obj.bankAccountNumber)
      ..writeByte(17)
      ..write(obj.bankAccountStatus)
      ..writeByte(18)
      ..write(obj.jobType)
      ..writeByte(19)
      ..write(obj.jobTitle)
      ..writeByte(20)
      ..write(obj.baseSalary)
      ..writeByte(21)
      ..write(obj.departmentId)
      ..writeByte(22)
      ..write(obj.address)
      ..writeByte(23)
      ..write(obj.avatar)
      ..writeByte(24)
      ..write(obj.branch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
