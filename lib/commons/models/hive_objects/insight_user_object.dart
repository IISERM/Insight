import 'package:hive/hive.dart';

part 'insight_user_object.g.dart';

@HiveType(typeId: 0)
class InsightUser {
  @HiveField(0)
  late String? accessToken;

  @HiveField(1)
  late String? token;

  @HiveField(2)
  late String? idToken;

  @HiveField(3)
  late String? secret;

  @HiveField(4)
  late String? refreshToken;


}
