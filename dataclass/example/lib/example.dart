import 'package:dataclass/dataclass.dart';

part 'example.g.dart';

@dataClass
class Data extends _$Data {
  final int id;
  final String name;

  const Data({this.id, this.name});
}

@dataClass
class Car extends _$Car {
  final String name;
  final String manufacturer;
  final double price;

  Car({this.name, this.manufacturer, this.price});
}

@dataClass
class NoFieldsClass extends _$NoFieldsClass {}

@dataClass
class Manufacturer extends _$Manufacturer {
  @Collection()
  final List<Car> cars;

  Manufacturer({this.cars});
}
