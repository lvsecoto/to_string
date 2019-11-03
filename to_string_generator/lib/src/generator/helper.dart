import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string/to_string.dart';

/// Check the element if annotated by [ToString]
bool hasToStringAnnotation(Element element) {
  return _toStringTypeChecker.hasAnnotationOf(element);
}

final _toStringTypeChecker = TypeChecker.fromRuntime(ToString);
