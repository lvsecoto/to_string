import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string/to_string.dart';

class ToStringGenerator extends GeneratorForAnnotation<ToString> {
  static const para_class_name = "o";
  const ToStringGenerator();

  static const _toStringTypeChecker = TypeChecker.fromRuntime(ToString);

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (!(element is ClassElement)) {
      print("Only supports class element");
      return null;
    }

    final clazzName = element.displayName;
    final fields = _collectField(element);
    final fieldValueCodes = fields.map(generateFieldValueStringCode);

    return generateToStringMethodCode(clazzName, fieldValueCodes);
  }

  /// Collect the field in [clazz]
  Iterable<FieldElement> _collectField(ClassElement clazz) {
    return clazz.fields.where(_shouldIncludeField);
  }

  /// Check[field] should be generate in `toString()`
  bool _shouldIncludeField(FieldElement field) {
    return _defaultInclude(field) || _getterInclude(field);
  }

  /// By default, include only field without getter and setter.
  bool _defaultInclude(FieldElement field) {
    return field.isPublic && !field.isSynthetic;
  }

  /// Include the getter with annotation [ToString]
  bool _getterInclude(FieldElement field) {
    return _isGetter(field) && _hasToStringAnnotation(field.getter);
  }

  /// Check field is getter
  bool _isGetter(FieldElement field) => field.isSynthetic && field.getter != null;

  /// Check element has [ToString] Annotation
  bool _hasToStringAnnotation(Element element) {
    return _toStringTypeChecker.hasAnnotationOf(element);
  }

  /// Generate 'toString' method that return a string with [clazzName] and [fieldValue]
  String generateToStringMethodCode(
      String clazzName, Iterable<String> fieldValue) {
    return """
    String ${generateToStringMethodName(clazzName)}($clazzName $para_class_name) {
       return "$clazzName{${fieldValue.join(", ")}}";
    }
    """;
  }

  /// Generate the name for `toString` method of [clazzName]
  String generateToStringMethodName(String clazzName) {
    return "_\$${clazzName}ToString";
  }

  /// Generate the code of [field] value in method 'toString'
  ///
  /// Sample:
  ///   o.field: $field
  String generateFieldValueStringCode(FieldElement field) {
    return "${field.displayName}: \${o.${field.displayName}}";
  }
}
