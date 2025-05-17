library profile_avatar;

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const ProfileAvatar({
    Key? key,
    required this.name,
    this.radius = 24.0,
    this.textStyle,
    this.backgroundColor,
  }) : super(key: key);

  String getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    String initials = parts[0][0];
    if (parts.length > 1) initials += parts[1][0];
    return initials.toUpperCase();
  }

  Color generateColor(String input) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.brown,
      Colors.teal,
      Colors.indigo,
    ];
    final hash = input.codeUnits.fold(0, (prev, e) => prev + e);
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final initials = getInitials(name);
    final bgColor = backgroundColor ?? generateColor(name);
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: radius,
      child: Text(
        initials,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: radius * 0.6,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
