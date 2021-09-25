// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      fullname: fields[0] as String,
      username: fields[1] as String,
      email: fields[2] as String,
      isVerified: fields[3] as bool,
      imageURL: fields[4] as String,
      balanceAmount: fields[5] as double,
      incomeAmount: fields[6] as double,
      expenseAmount: fields[7] as double,
      password: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.fullname)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.isVerified)
      ..writeByte(4)
      ..write(obj.imageURL)
      ..writeByte(5)
      ..write(obj.balanceAmount)
      ..writeByte(6)
      ..write(obj.incomeAmount)
      ..writeByte(7)
      ..write(obj.expenseAmount)
      ..writeByte(8)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
