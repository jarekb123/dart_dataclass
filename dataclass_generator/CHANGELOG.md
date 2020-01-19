## [0.3.0+2]
* Remove debug prints

## [0.3.0+1]
* Copy README from repository to `dataclass_generator` directory

## [0.3.0] - 2019/01/19
* Add @Collection() annotation to use DeepCollectionEquality from `collection` package to compare collections
* Add `@dataClass` shorthand for `@DataClass()`

## [0.2.2] - 2019/12/31
* **FIX** not generating full delcation of colletion. eg. `List get field` instead `List<myType> get field`

## [0.2.1] - 2019/12/26
* **FIX** not generating base classes for @DataClass classes with no fields

## [0.2.0] - 2019/12/25
* enable usage of generic types, eg. `Product<T>`
* **BREAKING CHANGE**: change generated class name from `_Class` to `_$Class`

## [0.1.0+2] - 2019/12/22
* update README - repo badges

## [0.1.0+1] - 2019/12/22
* add README

## [0.1.0] - 2019/12/22
* generating base class with equals, hashCode, toString, copyWith methods.
