// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_data.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$Product<T> {
  const _$Product();

  String get name;
  T get price;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Product) return false;

    return true && this.name == other.name && this.price == other.price;
  }

  int get hashCode {
    return mapPropsToHashCode([name, price]);
  }

  String toString() {
    return 'Product <\'name\': ${this.name},\'price\': ${this.price},>';
  }

  Product copyWith({String name, T price}) {
    return Product<T>(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
