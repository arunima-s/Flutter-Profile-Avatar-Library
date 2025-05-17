library profile_name_avatar;

import 'package:flutter/material.dart';

/// A widget that shows user initials in a circular avatar with background color.
///
/// It automatically extracts initials from the name and assigns a consistent
/// background color unless a custom one is provided.
class ProfileAvatar extends StatelessWidget {
  /// Full name of the user (e.g., "Sarbath Shameer")
  final String name;

  /// Radius of the circular avatar
  final double radius;

  /// Optional custom text style
  final TextStyle? textStyle;

  /// Optional background color. If null, a color will be generated from name hash.
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
