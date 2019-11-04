import 'package:analyzer/dart/element/element.dart';
import 'package:to_string_generator/src/generator/helper.dart';

/// Generate toString method code.
String generateToStringMethod(ClassElement clazz, Iterable<Element> members) =>
    """
String ${_getMethodName(clazz)}(${clazz.name} o) {
  return "${_getToStringCode(clazz, members)}";
}
""";

/// Get method name, it private and start with $.
String _getMethodName(ClassElement clazz) => r"_$" "${clazz.name}ToString";

/// Return string in method toString with [clazz] and [members].
String _getToStringCode(ClassElement clazz, Iterable<Element> members) {
  return "${clazz.name}{${_appendMemberToString(members)}}";
}

/// Return string in method toString with a serials of members.
String _appendMemberToString(Iterable<Element> members) {
  return members.map((member) => _memberToString(member)).join(", ");
}

/// Return string like "member: $member".
String _memberToString(Element member) {
  if (member is FieldElement) {
    return _fieldToString(member);
  } else {
    throw "$member is not support be generated toString";
  }
}

String _fieldToString(FieldElement field) {
  String accessor;
  if(isStatic(field)) {
    accessor = field.enclosingElement.name;
  } else {
    accessor = "o";
  }

  return "${field.name}: \${$accessor.${field.name}}";
}
