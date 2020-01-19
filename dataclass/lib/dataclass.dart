library dataclass;

export 'package:collection/collection.dart';

/// Short-hand annotation for `@DataClass()`.
/// You can use `@dataClass` instead of `@DataClass()`
const dataClass = DataClass();

class DataClass {
  /// DataClass annotation used for dataclass code generation
  const DataClass();
}

class Collection {
  final bool deepEquality;

  /// If `deepEquality` is set to true.
  /// The generated `operator==`  uses DeepCollectionEquality from collection package
  const Collection({this.deepEquality = true});
}

// Copied from equatable packages
int mapPropsToHashCode(Iterable props) =>
    _finish(props.fold(0, (hash, object) => _combine(hash, object)));

/// Jenkins Hash Functions
/// https://en.wikipedia.org/wiki/Jenkins_hash_function
int _combine(int hash, dynamic object) {
  if (object is Map) {
    object.forEach((key, value) {
      hash = hash ^ _combine(hash, [key, value]);
    });
    return hash;
  }
  if (object is Iterable) return mapPropsToHashCode(object);
  hash = 0x1fffffff & (hash + object.hashCode);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
