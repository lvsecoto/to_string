import 'package:analyzer/dart/element/element.dart';
import 'package:to_string_generator/src/generator/helper.dart';

/// An instance for check member should be include.
final memberInclude = MemberInclude();

final _include = <Include>[
  const DefaultInclude(),
  const AnnotatedInclude(),
];

abstract class Include {
  /// Return if [member] in [clazz] should be include in method `toString`
  bool shouldInclude(
      ClassElement clazz, Element member, Map<String, dynamic> configures);
}

class MemberInclude implements Include {
  /// For check the member should be include.
  const MemberInclude();

  @override
  bool shouldInclude(
      ClassElement clazz, Element member, Map<String, dynamic> configures) {
    return _include.any((include) {
      return include.shouldInclude(clazz, member, configures);
    });
  }
}

class DefaultInclude implements Include {
  /// By default only include non static public field
  const DefaultInclude();

  @override
  bool shouldInclude(
      ClassElement clazz, Element member, Map<String, dynamic> configures) {
    return member.isPublic && isField(member) && !isStatic(member);
  }
}

class AnnotatedInclude implements Include {
  /// Include getter, field with [ToString] annotating
  const AnnotatedInclude();

  @override
  bool shouldInclude(
      ClassElement clazz, Element member, Map<String, dynamic> configures) {
    return (isField(member) && hasToStringAnnotation(member)) ||
        (isGetter(member) &&
            hasToStringAnnotation((member as FieldElement).getter));
  }
}
