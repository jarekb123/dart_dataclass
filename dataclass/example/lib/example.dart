import 'package:dataclass/dataclass.dart';

part 'example.g.dart';

@DataClass()
class Data extends _$Data {
  final int id;
  final String name;

  const Data({this.id, this.name});
}

@DataClass()
class Car extends _$Car {
  final String name;
  final String manufacturer;
  final double price;

  Car({this.name, this.manufacturer, this.price});
}
