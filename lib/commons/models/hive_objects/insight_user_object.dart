import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/settings_object.dart';

part 'insight_user_object.g.dart';

@HiveType(typeId: 1)
class InsightUser {
  @HiveField(0)
  late String accessToken;

  @HiveField(1)
  late String? token;

  @HiveField(2)
  late String? idToken;

  @HiveField(3)
  late String? secret;



}
