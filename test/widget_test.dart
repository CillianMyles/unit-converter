import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/main.dart';

void main() {
  testWidgets('App title smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(UnitConverterApp());
    expect(find.text('Unit Converter'), findsOneWidget);
  });
}
