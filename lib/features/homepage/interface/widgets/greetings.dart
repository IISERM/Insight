import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/commons/models/hive_objects/student.dart';

class GreetingWidget extends ConsumerWidget {
  const GreetingWidget({super.key, this.student});

  final Student? student;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = student?.name?.split(" ")[0] ?? "User";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello!'),
            Text(name),
          ],
        ),
        GestureDetector(
          child: ProfileButton(photoURL: student?.photoURL ?? "placeholder"),
          onTap: () async {
            //TODO: Implement onTap
          },
        )
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String photoURL;

  const ProfileButton({super.key, required this.photoURL});

  @override
  Widget build(BuildContext context) {
    ImageProvider profile = Image.network(photoURL).image;
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          image: DecorationImage(image: profile)),
    );
  }
}
