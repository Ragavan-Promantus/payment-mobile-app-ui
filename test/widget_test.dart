import 'package:flutter_test/flutter_test.dart';
import 'package:benepay/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BenePayApp());

    // Verify that the login screen title is present.
    expect(find.text('Secure Business Login'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
