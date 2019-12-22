# dataclass

`@Dataclass` annotation used for dataclass_generator

The DataClass generator generates base class for your data class with methods:

- equals (operator ==)
- hashCode
- toString
- copyWith

## Getting Started

### 1. Annotate your class with @DataClass

The class should:

- has only final fields
- unnamed constructor with named parameters for all fields

```dart
@DataClass()
class Car {
  final String name;
  final String manufacturer;
  final double price;

  Car({this.name, this.manufacturer, this.price});
}
```

### 2. Generate dataclass base class

Run `pub run build_runner build`

#### Generated file

```dart
abstract class _Car {
  const _Car();

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

  int hashCode() {
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
```

### 3. Extend class with generated base class

```dart
@DataClass()
class Car extends _Car {
  final String name;
  final String manufacturer;
  final double price;
}
```

## FAQ

1. Why you didn't use extension methods?

As the docs says that:

<i>It is a compile-time error if an extension:

- Declares a member with the same basename as a member declared by Object (==, hashCode, toString, noSuchMethod, runtimeType). This applies to both static and instance member declarations.
  </i>
