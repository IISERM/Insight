import 'package:flutter/material.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160.0,
          child: Card(
            child: Text('Container ${index + 1}'),
          ),
        );
      },
    );
  }
}