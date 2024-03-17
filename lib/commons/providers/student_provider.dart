import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:insight/commons/models/hive_objects/student.dart';

final studentProvider = FutureProvider<Student>((ref) async {
  Box<Student> studentBox = await Hive.openBox("student_box");
  return studentBox.values.first;
});
