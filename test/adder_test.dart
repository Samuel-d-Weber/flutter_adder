import 'package:test/test.dart';
import 'package:flutter_adder/adder.dart';

void main() {
  group('Adder tests', () {
    test('Adder should return 0', () {
      final Adder adder = Adder();
      expect(adder.sum, 0);
    });

    test('Adder should return the sum', () {
      final Adder adder = Adder();
      adder.a = 1;
      adder.b = 2;
      expect(adder.sum, 3);
    });
  });
}