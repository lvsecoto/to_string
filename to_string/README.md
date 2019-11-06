# to_string
[![Pub Package](https://img.shields.io/pub/v/to_string.svg)](https://pub.dev/packages/to_string) 
[![Build Status](https://travis-ci.org/lvsecoto/to_string.svg?branch=master)](https://travis-ci.org/lvsecoto/to_string)

A tool for generating toString method for class, based on `build_runner`.

## Who uses this tool
Someone who is boring to write and maintain the method `toString()`

## Installation

Add dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  to_string: ^1.0.1

dev_dependencies:
  to_string_generator: ^1.0.1
  build_runner: ^1.7.1
```

## Usage

In class you want to write toString() method:

* Annotate the class with `ToString()`
* Override the `toString` method.

```dart
/// cat.dart
import 'package:to_string/to_string.dart';

part 'cat.g.dart';

@ToString()
class Cat {
  Cat(this.color, this.weight);
  
  String color;
  double weight;
  
  @override
  String toString() {
    // [_$CatToString] is generated at `cat.g.dart`,
    // and it returns likes "Cat{color: white, weight: 1.2}"
    return _$CatToString(this);
  }
}
```

By default, getter, static field, and private field will not be shown in 
`toString`. But you can use `ToString` to make them show.

```dart
/// cat.dart
import 'package:to_string/to_string.dart';

part 'cat.g.dart';

@ToString()
class Cat {
  
  @ToString()
  static int leg = 4;
  
  Cat(this.color, this.weight, this.wings);
  
  String color;
  double weight;
  String wings;
  
  String _heart = "warm";
  
  @ToString()
  bool get hasWings => wings != null;
  
  @override
  String toString() {
    // [_$CatToString] is generated at `cat.g.dart`,
    // and it returns likes this: 
    // "Cat{leg: Cat.leg, color: white, weight: 1.2, wings: null, _heart: warm, hasWings: false}"
    return _$CatToString(this);
  }
}
```

If you annotate `ToString()` to the class\`s supper class or mixin, their
field (public field and other field with `ToString()`) will be include 
in the base class method toString.

```dart
/// cat.dart
@ToString()
class Animal {
  bool needOxygen = true;
}

@ToString()
class Rocket {
  bool canFly = true;
}

@ToString()
class Cat extends Animal with Rocket{
  
  String name;
  
  @override
  String toString() {
    // [_$CatToString] is generated at `cat.g.dart`,
    // and it returns likes this: 
    // "Cat{needOxygen: true, canFly: true, name: kitty}"
    return _$CatToString(this);
  }
}

```

Lastly, we use [build_runner](https://pub.dev/packages/build_runner)!

In flutter
```
flutter packages pub run build_runner build
```

In dart
```
pub run build_runner build
```

## Features and bugs

Please file feature requests and bugs at the Github Issue Tracker.

Github Issue tracker: https://github.com/lvsecoto/to_string/issues
