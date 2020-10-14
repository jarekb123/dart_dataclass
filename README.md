# dataclass

[![License](https://img.shields.io/github/license/jarekb123/dart_dataclass?style=flat-square&logo=github)](https://github.com/jarekb123/dart_dataclass/blob/master/LICENSE)  [![Github Stars](https://img.shields.io/github/stars/jarekb123/dart_dataclass?style=flat-square&logo=github)](https://github.com/jarekb123/dart_dataclass)

## Packages Versions on PUB
* `dataclass` - ![Pub Version](https://img.shields.io/pub/v/dataclass)
* `dataclass_generator` - ![Pub Version](https://img.shields.io/pub/v/dataclass_generator)

`@DataClass` annotation used for dataclass_generator

The DataClass generator generates base class for your data class with methods:

- equals (operator ==)
- hashCode
- toString
- copyWith

## Getting Started

### 0. Add dependencies to pubspec.yaml

```yaml
dependencies:
  dataclass: latest_version
dev_dependencies:
  dataclass_generator: latest_version
```


### 1. Annotate your class with @dataClass

The class should:

- has only final fields
- unnamed constructor with named parameters for all fields

```dart
@dataClass
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
```

### 3. Extend class with generated base class

```dart
@dataClass
class Car extends _$Car {
  final String name;
  final String manufacturer;
  final double price;

  Car({this.name, this.manufacturer, this.price});
}
```

#### Collection equality
```dart

@dataClass
class Car extends _$Car {
  @Collection(deepEquality: true) // Short-hand: @Collection()
  final List<String> parts;

  const Car({this.parts});
}
```

## FAQ

1. Why you didn't use extension methods?

As the docs says that:

<i>It is a compile-time error if an extension:

- Declares a member with the same basename as a member declared by Object (==, hashCode, toString, noSuchMethod, runtimeType). This applies to both static and instance member declarations.
  </i>

2. May I use generics?

Yes.