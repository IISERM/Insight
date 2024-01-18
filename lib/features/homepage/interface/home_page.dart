import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:insight/features/homepage/interface/widgets/facilities.dart';
import 'package:insight/features/homepage/interface/widgets/greetings.dart';
import 'package:insight/features/homepage/interface/widgets/helpful_tiles.dart';
import 'package:insight/features/homepage/interface/widgets/notification_container.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingWidget(),
              NotificationsContainer(),
              // Facilities(),
              helpfulText,
              HelpfulTiles(),
            ],
          ),
        ),
      )),
    );
  }
}

Text helpfulText = const Text('Helpful');
