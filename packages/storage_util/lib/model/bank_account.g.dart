// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankAccountAdapter extends TypeAdapter<BankAccount> {
  @override
  final int typeId = 39;

  @override
  BankAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankAccount(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BankAccount obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.myMoney)
      ..writeByte(2)
      ..write(obj.mob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
