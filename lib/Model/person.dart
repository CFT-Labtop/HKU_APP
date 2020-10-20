import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId : 1)
class Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<Person> friends;

  Person({String this.name, int this.age}){}
}