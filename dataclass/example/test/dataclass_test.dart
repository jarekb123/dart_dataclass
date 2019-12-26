// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:dataclass_example/example.dart';

void main() {
  final car1 = Car(name: 'Corolla', manufacturer: 'Toyota', price: 500.0);
  final car2 = Car(name: 'Corolla', manufacturer: 'Toyota', price: 500.0);
  final car3 = Car(name: 'Avensis', manufacturer: 'Toyota', price: 500.0);

  group('equals', () {
    test('car1 == car2', () {
      expect(car1, car2);
    });

    test('car2 != car3', () {
      expect(car2, isNot(car3));
    });
  });

  group('hashCode', () {
    test('car1 hashCode == car2 hashCode', () {
      expect(car1.hashCode, car2.hashCode);
    });

    test('car1 hashCode != car3 hashCode', () {
      expect(car1.hashCode, isNot(car3.hashCode));
    });
  });

  group('copyWith', () {
    test('car1 copyWith is creating new instance', () {
      final copiedCar1 = car1.copyWith();

      assert(!identical(car1, copiedCar1));
    });

    test('car3 with changed name to Corolla equals to car1', () {
      expect(car3.copyWith(name: 'Corolla'), car1);
    });
  });
}
