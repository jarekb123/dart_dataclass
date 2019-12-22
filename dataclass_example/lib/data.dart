import 'package:dataclass/dataclass.dart';

part 'data.g.dart';

@DataClass()
class Data extends _Data {
  final int id;
  final String name;

  const Data({this.id, this.name});
}

@DataClass()
class Car extends _Car {
  final String name;
  final String manufacturer;
  final double price;

  Car({this.name, this.manufacturer, this.price});
}