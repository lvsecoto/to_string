/// Annotation for generating `toString()` method.
///
/// By default, toString only contain public field exclude getter.
///
/// ```dart
/// /// cat.dart
///
/// part 'cat.g.dart';
///
/// @ToString()
/// class Cat {
///   var color = "white";
///   var _heart = "warm";
///   bool get hasWings => false;
///
///   @override
///   String toString() {
///     // return "Cat{color: white}"
///     return _$CatToString(this);
///   }
/// }
/// ```
class ToString {
  const ToString();
}
