## [0.3.0+1]
* Copy README from repository to `dataclass` directory

## [0.3.0] - 2019/01/19
* Add @Collection() annotation to use DeepCollectionEquality from `collection` package to compare collections
* Add `@dataClass` shorthand for `@DataClass()`

## [0.2.0] - 2019/12/25
* enable usage of generic types, eg. `Product<T>`
* **BREAKING CHANGE**: change generated class name from `_Class` to `_$Class`
* move example to `dataclass` package directory

## [0.1.0+1] - 2019/12/22
* update README - badges

## [0.1.0] - 2019/12/22

* `@DataClass()` annotation used by `dataclass_generator`
* `mapPropsToHashCode` from `equatable` package used by `hashCode` getter
