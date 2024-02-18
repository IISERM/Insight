import 'package:hive/hive.dart';

part 'settings_object.g.dart';

@HiveType(typeId: 2)
class Settings {
  @HiveField(4)
  late Map<String, bool> facilities;

  @HiveField(5)
  late Map<String, bool> helpfulTiles;

}
