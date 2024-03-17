import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/settings_object.dart';
import 'package:insight/commons/models/hive_objects/student.dart';
import 'package:insight/commons/models/hive_objects/insight_user_object.dart';

void registerTypeAdapters() {
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(InsightUserAdapter());
  Hive.registerAdapter(StudentAdapter());
}