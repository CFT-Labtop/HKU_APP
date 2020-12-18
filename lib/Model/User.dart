import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
@HiveType(typeId: 16)
class User extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String password;
  @HiveField(2)
  @JsonKey(fromJson: BaseModel.fromJsonStringList)
  List<String> type;
  @HiveField(3)
  String loginName;
  @override
  int getID() => this.ID;

  User({int this.ID,
    String this.loginName,
    String this.password,
    List<String> this.type,
  }) {}

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}