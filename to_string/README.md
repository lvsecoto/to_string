[![Pub Package](https://img.shields.io/pub/v/to_string.svg)](https://pub.dev/packages/to_string)

A tools for generating toString method for class, based on `build_runner`.

## Installation

Add dependencies in your `pubspec.yaml`:
```yaml
dependencies:
  to_string: ^0.0.1

dev_dependencies:
  to_string_generator: ^0.0.1
  build_runner: ^1.7.1
```

## Usage

In class you want toString() method:

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
    // [_$CatToString] is generated at `cat.g.dart`
    return _$CatToString(this);
  }
}
```

Use [build_runner](https://pub.dev/packages/build_runner)

In flutter
```
flutter packages pub run build_runner build
```

In dart
```
pub run build_runner build
```

Then:

```
void main() {
  // result: Cat2{color: black, weight: 1.12}
  print(Cat("black", 1.12));
}
```

## Features and bugs

Please file feature requests and bugs at the Github Issue Tracker.

Github Issue tracker: https://github.com/lvsecoto/to_string/issues
