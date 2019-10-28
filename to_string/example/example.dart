import 'package:to_string/to_string.dart';

part 'example.g.dart';

@ToString()
class Cat {
  Cat({this.color, this.weight, this.wings});

  final classify = "Animal";

  String color;

  double weight;

  String wings;

  /// toString() will return like this:
  ///
  /// ```dart
  /// 'Cat{classify: Animal, color: white, weight: 1.14, wings: null}';
  /// ```
  @override
  String toString() {
    return _$CatToString(this);
  }
}
