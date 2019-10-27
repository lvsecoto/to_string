import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string/to_string.dart';

class ToStringGenerator extends GeneratorForAnnotation<ToString> {
   static const para_class_name = "o";
   static const to_string_method_name = "_\$toString";

   const ToStringGenerator();

   @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (!(element is ClassElement)) {
      print("Only supports class element");
      return null;
    }

    final clazzName = element.displayName;
    final fields = collectField(element);
    final fieldValueCodes = fields.map(generateFieldValueStringCode);

    return generateToStringMethodCode(clazzName, fieldValueCodes);
  }

  /// Collect the field in [clazz]
  List<FieldElement> collectField(ClassElement clazz) {
    final fields = <FieldElement>[];

    // We only collect public field, exclude setter and getter
    clazz.fields.forEach((field) {
      if (field.isPublic && !field.isSynthetic) {
        fields.add(field);
      }
    });

    return fields;
  }

  /// Generate 'toString' method that return a string with [clazzName] and [fieldValue]
  String generateToStringMethodCode(String clazzName, Iterable<String> fieldValue) {
    return """
    String $to_string_method_name($clazzName $para_class_name) {
       return "$clazzName{${fieldValue.join(", ")}}";
    }
    """;
  }

  /// Generate the code of [field] value in method 'toString'
  ///
  /// Sample:
  ///   o.field: $field
  String generateFieldValueStringCode(FieldElement field) {
    return "${field.displayName}: \${o.${field.displayName}}";
  }
}
