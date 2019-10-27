A tools for generating toString method for class, based on `build_runner`.

[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

Add dependencies to your `pubspec.yaml`:
```yaml
dependencies:
  to_string:
  
dev_dependencies:
  to_string_generator:
  build_runner:
```

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
    // [_$toString] is generated at `cat.g.dart`
    return _$toString();
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

## Features and bugs

Please file feature requests and bugs at the Github Issue.

Issue tracker: http://example.com/issues/replaceme
