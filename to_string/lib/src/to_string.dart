library to_string;

/// Annotation for generating [toString] method.
///
/// By default, toString only contain public field exclude getter.
///
/// You can annotate [ToString] to getters to let them shown in [toString]
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
///
///   @ToString()
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
  /// If [prettyPrint] is set to true, [indent] will be default to "  ".
  /// Otherwise, indent will be ""
  const ToString({
    bool prettyPrint,
    String indent,
  })  : this.prettyPrint = prettyPrint,
        this.indent = (prettyPrint ?? false) ? (indent ?? "  ") : null;

  /// Enable pretty print
  final bool prettyPrint;

  /// The line indent
  final String indent;
}
