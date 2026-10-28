import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_4/main.dart';

void main() {
  testWidgets('Bottom navigation opens people, chats, and calls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ConnectApp());

    expect(find.text('People'), findsOneWidget);
    expect(find.text('Sofia Martinez'), findsOneWidget);
    expect(find.text('Are we still meeting at 3?'), findsNothing);

    await tester.tap(find.text('Chats'));
    await tester.pump();

    expect(find.text('Your recent conversations'), findsOneWidget);
    expect(find.text('Are we still meeting at 3?'), findsOneWidget);

    await tester.tap(find.text('Calls'));
    await tester.pump();

    expect(find.text('Recent calls'), findsOneWidget);
    expect(find.text('Today, 10:15 AM'), findsOneWidget);
  });
}
