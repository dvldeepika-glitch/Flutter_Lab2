
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_exp2/main.dart';

void main() {
  testWidgets('Flutter Layout Demo loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const WidgetLayoutDemo());

    expect(find.text('Flutter Layout Demo'), findsOneWidget);
    expect(find.text('Widgets'), findsOneWidget);
    expect(find.text('Row'), findsOneWidget);
    expect(find.text('Column'), findsOneWidget);
    expect(find.text('Stack'), findsOneWidget);
  });
}