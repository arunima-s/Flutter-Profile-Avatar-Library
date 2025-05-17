import 'package:flutter/material.dart';
import 'package:profile_avatar/profile_avatar.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProfileAvatar(name: "Alice Wonderland", radius: 50),
      ),
    ),
  ));
}
