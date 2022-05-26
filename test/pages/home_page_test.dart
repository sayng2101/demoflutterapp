import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() {
  group('Home page show', () {
    Finder checkBt() => find.text('Check');
    Finder nextBt() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));
    testWidgets(
      'Click next to iterate over the product list',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: HomePage(),
        ));
        expect(find.text(products[0].name), findsOneWidget);

        for (int i = 1; i < 5; i++) {
          await tester.tap(checkBt());
          await tester.enterText(priceInput(), '0');
          await tester.pump();
          await tester.tap(nextBt());
          await tester.pump();
          expect(find.text(products[i].name), findsOneWidget);
        }

        await tester.tap(checkBt());
        await tester.pump();
        await tester.tap(nextBt());
        await tester.pump();
        expect(find.text(products[4].name), findsOneWidget);
      },
    );
    testWidgets(
      'Check result & show next product',
      ((WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: HomePage(),
        ));
        await tester.enterText(priceInput(), '3');
        await tester.tap(checkBt());
        await tester.pump();
        expect(find.text('pass'), findsOneWidget);

        await tester.tap(nextBt());
        await tester.pump();

        await tester.enterText(priceInput(), '7');
        await tester.tap(checkBt());
        await tester.pump();
        expect(find.text('fail'), findsOneWidget);

        await tester.tap(nextBt());
        await tester.pump();

        await tester.enterText(priceInput(), '8');
        await tester.tap(checkBt());
        await tester.pump();
        expect(find.text('pass'), findsOneWidget);
      }),
    );
  });
}
