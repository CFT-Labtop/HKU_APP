import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Version.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class Version extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String version_name;
  @HiveField(2)
  @JsonKey(fromJson: BaseModel.fromJsonDateTime, toJson: BaseModel.toJsonDateTime)
  DateTime qoh_date;
  @HiveField(3)
  @JsonKey(fromJson: BaseModel.fromJsonIntList)
  List<int> take_location;
  @HiveField(4)
  @JsonKey(fromJson: BaseModel.fromJsonDateTime, toJson: BaseModel.toJsonDateTime)
  DateTime complete_date;
  @HiveField(5)
  @JsonKey(fromJson: BaseModel.fromJsonBool, toJson: BaseModel.toJsonBool)
  
  bool status;
  @HiveField(6)
  String create_user;
  @HiveField(7)
  @JsonKey(fromJson: BaseModel.fromJsonIntList)
  List<int> downloaded_location = [];
  @override
  int getID() => this.ID;

  Version({int this.ID,
    String this.version_name,
    DateTime this.qoh_date,
    List<int> this.take_location,
    DateTime this.complete_date,
    bool this.status,
    String this.create_user,
    List<int> this.downloaded_location = const [],
  }) {}

  static Version getLatestVersion(){
    Version version = null;
    BaseDataBase().getAll<Version>().forEach((element) {
      if(version == null) version = element;
      else if(version.getID() < element.getID())
        version = element;
    });
    return version;
  }

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}