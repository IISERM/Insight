import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/settings_object.dart';
import 'package:insight/commons/models/hive_objects/insight_user_object.dart';

part 'student.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  late String registrationNumber;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String photoURL;

  @HiveField(3)
  late bool isSubscribedToSRM;

  @HiveField(4)
  late Settings settings;

  @HiveField(5)
  late InsightUser user;
}
