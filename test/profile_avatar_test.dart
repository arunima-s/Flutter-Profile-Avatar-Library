import 'package:flutter_test/flutter_test.dart';
import 'package:profile_avatar/profile_avatar.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Initials are extracted correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileAvatar(name: "Jane Doe"),
      ),
    );

    expect(find.text('JD'), findsOneWidget);
  });
}
