import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_invisible_textfield_bug/main.dart';

void main() {
  patrolTest(
    'Complete flow test - username to welcome page',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      // Start the app
      await $.pumpWidget(const MyApp());

      // Enter username and tap next
      await $(Key('username_text_field')).enterText('test');
      await $(Key('username_next_button')).tap();

      // Enter password and tap next
      await $(Key('password_text_field')).enterText('123456');
      await $(Key('password_next_button')).tap();

      // Verify we're on the welcome page with correct username
      expect(
        $(Key('welcome_text')).text,
        'test',
        reason: 'Welcome page should display the entered username',
      );
    },
  );
}
