import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string/to_string.dart';

/// Check the element if annotated by [ToString].
bool hasToStringAnnotation(Element element) {
  return _toStringTypeChecker.hasAnnotationOf(element);
}

final _toStringTypeChecker = TypeChecker.fromRuntime(ToString);

/// Is field or getter static.
bool isStatic(Element element) {
  if (isField(element)) {
    return (element as FieldElement).isStatic;
  } else if (isGetter(element)) {
    return (element as FieldElement).getter.isStatic;
  } else {
    throw 'Is not field or getter!';
  }
}

bool isGetter(Element element) {
  return element is FieldElement &&
      element.isSynthetic &&
      element.getter != null;
}

bool isField(Element element) {
  return element is FieldElement && !element.isSynthetic;
}
