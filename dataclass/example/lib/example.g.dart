// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$Data {
  const _$Data();

  int get id;
  String get name;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Data) return false;

    return true && this.id == other.id && this.name == other.name;
  }

  int get hashCode {
    return mapPropsToHashCode([id, name]);
  }

  String toString() {
    return 'Data <\'id\': ${this.id},\'name\': ${this.name},>';
  }

  Data copyWith({int id, String name}) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

abstract class _$Car {
  const _$Car();

  String get name;
  String get manufacturer;
  double get price;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Car) return false;

    return true &&
        this.name == other.name &&
        this.manufacturer == other.manufacturer &&
        this.price == other.price;
  }

  int get hashCode {
    return mapPropsToHashCode([name, manufacturer, price]);
  }

  String toString() {
    return 'Car <\'name\': ${this.name},\'manufacturer\': ${this.manufacturer},\'price\': ${this.price},>';
  }

  Car copyWith({String name, String manufacturer, double price}) {
    return Car(
      name: name ?? this.name,
      manufacturer: manufacturer ?? this.manufacturer,
      price: price ?? this.price,
    );
  }
}

abstract class _$NoFieldsClass {
  const _$NoFieldsClass();

  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! NoFieldsClass) return false;

    return true;
  }

  int get hashCode {
    return mapPropsToHashCode([]);
  }

  String toString() {
    return 'NoFieldsClass <>';
  }

  NoFieldsClass copyWith() {
    return NoFieldsClass();
  }
}

abstract class _$Manufacturer {
  const _$Manufacturer();

  List<Car> get cars;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! Manufacturer) return false;

    return true && this.cars == other.cars;
  }

  int get hashCode {
    return mapPropsToHashCode([cars]);
  }

  String toString() {
    return 'Manufacturer <\'cars\': ${this.cars},>';
  }

  Manufacturer copyWith({List<Car> cars}) {
    return Manufacturer(
      cars: cars ?? this.cars,
    );
  }
}
