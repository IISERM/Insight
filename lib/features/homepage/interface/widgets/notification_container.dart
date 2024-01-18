import 'package:flutter/material.dart';

 class NotificationsContainer extends StatefulWidget {
  const NotificationsContainer({super.key});


  @override
  State<NotificationsContainer> createState() => _NotificationsContainerState();
}

class _NotificationsContainerState extends State<NotificationsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        children:   <Widget>[
          Text(
            'Notifications',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          // Add your notification widgets here
        ],
      ),
    );
  }
}
