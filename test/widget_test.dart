// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_adder/main.dart';

void main() {
  testWidgets('Adder smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AdderApp());
    
    final inputA = find.byKey(Key('adder_field_a'));
    final inputB = find.byKey(Key('adder_field_b'));
    final sumButton = find.byKey(Key('adder_result_button'));

    // Tap the sum button
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(2));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(0));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));


    // Insert invalid value on field a and tap the sum button
    await tester.enterText(inputA, 'a');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(1));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(1));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert invalid value on field b and tap the sum button
    await tester.enterText(inputA, '');
    await tester.enterText(inputB, 'b');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(1));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(1));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert invalid value on both fields and tap the sum button
    await tester.enterText(inputA, 'a');
    await tester.enterText(inputB, 'b');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(0));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(2));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert valid value on field a, nothing on field b and tap the sum button
    await tester.enterText(inputA, '1');
    await tester.enterText(inputB, '');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(1));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(0));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert valid value on field b, nothing on field a and tap the sum button
    await tester.enterText(inputA, '');
    await tester.enterText(inputB, '2');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(1));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(0));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert valid value on field a, invalid value on field b and tap the sum button
    await tester.enterText(inputA, '1');
    await tester.enterText(inputB, 'b');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(0));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(1));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert valid value on field b, invalid value on field a and tap the sum button
    await tester.enterText(inputA, 'a');
    await tester.enterText(inputB, '2');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(0));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(1));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(0));

    // Insert valid value on both fields and tap the sum button
    await tester.enterText(inputA, '1');
    await tester.enterText(inputB, '2');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result has appeared, and is correct
    expect(find.text('Por favor insira algo!'), findsNWidgets(0));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(0));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(1));
    Text result = find.byKey(Key('adder_result_text')).evaluate().first.widget;
    expect(result.data, '3');

    // Insert valid value on both fields and tap the sum button
    await tester.tapAt(Offset(0, 0));
    await tester.pump();
    await tester.enterText(inputA, '5');
    await tester.enterText(inputB, '7');
    await tester.tap(sumButton);
    await tester.pump();

    // Verify that the result hasn't appeared and that the correct error messages are shown
    expect(find.text('Por favor insira algo!'), findsNWidgets(0));
    expect(find.text('Por favor insira um número inteiro!'), findsNWidgets(0));
    expect(find.byKey(Key('adder_result_dialog')), findsNWidgets(1));
    result = find.byKey(Key('adder_result_text')).evaluate().first.widget;
    expect(result.data, '12');

    await tester.tapAt(Offset(0, 0));
    await tester.pump();

  });
}
