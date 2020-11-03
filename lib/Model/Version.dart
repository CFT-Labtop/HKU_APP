import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Version.g.dart';

@HiveType(typeId: 11)
class Version extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String version_name;
  @HiveField(2)
  DateTime qoh_date;
  @HiveField(3)
  List<int> take_location;
  @HiveField(4)
  DateTime complete_date;
  @HiveField(5)
  bool status;
  @HiveField(6)
  String create_user;
  @override
  int getID() => this.ID;

  Version({int this.ID,
    String this.version_name,
    DateTime this.qoh_date,
    List<int> this.take_location,
    DateTime this.complete_date,
    bool this.status,
    String this.create_user,
  }) {}

  Version.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.version_name = json["version_name"] ?? null;
    this.qoh_date = DateTime.parse(json["qoh_date"]) ?? null;
    this.take_location = json["take_location"] != null? (json["take_location"] as List<dynamic>).map((e) => int.parse(e)).toList() :null;
    this.complete_date = json["complete_date"] != null ? DateTime.parse(json["complete_date"]) : null;
    this.status = json["status"] == 1 ?true: false;
    this.create_user = json["create_user"] ?? null;
  }

  static Version getLatestVersion(){
    Version version = null;
    BaseDataBase().getAll<Version>().forEach((element) {
      if(version == null) version = element;
      else if(version.getID() < element.getID())
        version = element;
    });
    return version;
  }
}