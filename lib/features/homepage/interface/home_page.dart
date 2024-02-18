import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/commons/models/hive_objects/student.dart';
import 'package:insight/commons/providers/student_provider.dart';
import 'package:insight/features/homepage/interface/widgets/greetings.dart';
import 'package:insight/features/homepage/interface/widgets/helpful_tiles.dart';
import 'package:insight/features/homepage/interface/widgets/notification_container.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Student> futureStudent = ref.watch(studentProvider);
    Student? student = futureStudent.value;


    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingWidget(student: student),
              const NotificationsContainer(),
              // Facilities(),
              helpfulText,
              const HelpfulTiles(),
            ],
          ),
        ),
      )),
    );
  }
}

Text helpfulText = const Text('Helpful');
