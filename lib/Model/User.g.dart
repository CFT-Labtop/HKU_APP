// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 16;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      ID: fields[0] as int,
      loginName: fields[3] as String,
      password: fields[1] as String,
      type: (fields[2] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.loginName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    ID: json['ID'] as int,
    loginName: json['loginName'] as String,
    password: json['password'] as String,
    type: BaseModel.fromJsonStringList(json['type'] as List),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'ID': instance.ID,
      'password': instance.password,
      'type': instance.type,
      'loginName': instance.loginName,
    };
