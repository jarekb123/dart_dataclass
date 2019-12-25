import 'package:dataclass/dataclass.dart';

part 'generic_data.g.dart';

@DataClass()
class Product<T> {
  final String name;
  final T price;

  Product({this.name, this.price});
}
