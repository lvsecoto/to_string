import 'package:analyzer/dart/element/element.dart';
import 'package:to_string_generator/src/generator/helper.dart';
import 'package:to_string_generator/src/generator/member_include.dart';

/// Collect all [clazz] element to add to [toString] method
List<Element> collectClassMemberToString(ClassElement clazz) {
  final members = clazz.fields;

  return clazz.allSupertypes
      .where((it) => hasToStringAnnotation(it.element))
      .map((it) => _pickMember(it.element, it.element.fields))
      .fold<List<Element>>(<Element>[], (previous, element) {
    return previous..addAll(element);
  }) + _pickMember(clazz, members);
}

/// Pick member to put into method `toString`
List<Element> _pickMember(ClassElement clazz, Iterable<Element> members) =>
    members
        .where((member) => memberInclude.shouldInclude(clazz, member, null))
        .toList();
