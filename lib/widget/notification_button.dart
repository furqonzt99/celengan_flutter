import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  bool _isNotification = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isNotification
          ? Icon(Icons.notifications_active)
          : Icon(Icons.notifications_off),
      iconSize: 24,
      onPressed: () {
        setState(() {
          _isNotification = !_isNotification;
        });
      },
    );
  }
}