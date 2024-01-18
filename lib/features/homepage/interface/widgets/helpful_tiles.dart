// scrollable_row1.dart
import 'package:flutter/material.dart';

class HelpfulTiles extends StatelessWidget {
  const HelpfulTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
