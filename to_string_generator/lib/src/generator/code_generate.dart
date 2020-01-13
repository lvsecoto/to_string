import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string_generator/src/generator/helper.dart';

class Config {
  final bool prettyPrint;
  final String indent;

  Config({bool prettyPrint, String indent}):
      this.prettyPrint = prettyPrint ?? false,
      this.indent = prettyPrint ?? false ? (indent ?? "  ") : (indent ?? "");
}

/// Generate toString method code.
String generateToStringMethod(
        ClassElement clazz, Iterable<Element> members, Config config) =>
    """
String ${_getMethodName(clazz)}(${clazz.name} o) {
  return \"\"\"${_getToStringCode(
      clazz,
      members,
      prettyPrint: config.prettyPrint,
      indent: config.indent,
    )}\"\"\";
}""";

/// Get method name, it private and start with $.
String _getMethodName(ClassElement clazz) => r"_$" "${clazz.name}ToString";

/// Return string in method toString with [clazz] and [members].
String _getToStringCode(
  ClassElement clazz,
  Iterable<Element> members, {
  bool prettyPrint,
  String indent,
}) {
  if (prettyPrint == true) {
    return "${clazz.name}{\n${_appendMemberToString(
      members,
      suffix: ",\n",
      join: "",
      indent: indent,
    )}}";
  } else {
    return "${clazz.name}{${_appendMemberToString(
      members,
      suffix: "",
      join: ", ",
      indent: "",
    )}}";
  }
}

/// Return string in method toString with a serials of members.
String _appendMemberToString(Iterable<Element> members,
    {String suffix, String join, String indent}) {
  return members
      .map((member) =>
          _indent(_memberToString(member, indent), indent: indent) + suffix)
      .join(join);
}

String _indent(String input, {String indent}) {
  return indent + input;
}

/// Return string like "member: $member".
///
/// if "$member" is combine with multiple line, line exclude first will has [indent]
String _memberToString(Element member, String indent) {
  if (member is FieldElement) {
    return _fieldToString(member, indent);
  } else {
    throw "$member is not support be generated toString";
  }
}

String _fieldToString(FieldElement field, String indent) {
  String accessor;
  if (isStatic(field)) {
    accessor = field.enclosingElement.name;
  } else {
    accessor = "o";
  }

  if (indent.isNotEmpty) {
    return "${field.name}: \${$accessor.${field.name}.toString().split(\"\\n\").join(\"\\n$indent\")}";
  } else {
    return "${field.name}: \${$accessor.${field.name}}";
  }
}
