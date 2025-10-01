// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:lightsaber_app/main.dart';

void main() {
  testWidgets('Lightsaber app displays Hello there text', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LightsaberApp());

    // Verify that our neon text is displayed.
    expect(find.text('Hello there'), findsOneWidget);

    // Verify that the lightsaber button is present.
    expect(find.text('Change Lightsaber Color'), findsOneWidget);

    // Verify that the instruction text is present.
    expect(find.text('Tap anywhere or shake your device!'), findsOneWidget);
  });
}
