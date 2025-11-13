import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 2. Use the testWidgets function
  testWidgets('Text widget displays Hello', (WidgetTester tester) async {
    // 3. Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Hello'),
        ),
      ),
    );

    // 4. Verify the Text widget is found
    expect(find.text('Hello'), findsOneWidget);
  });
}
