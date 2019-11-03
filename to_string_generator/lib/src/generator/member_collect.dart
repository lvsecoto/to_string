import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:to_string_generator/src/generator/member_include.dart';

/// Collect all [clazz] element to add to [toString] method
List<Element> collectClassMemberToString(ClassElement clazz) {
  final members = _MemberVisitor().collectMember(clazz);
  return _pickMember(clazz, members);
}

/// Pick member to put into method `toString`
List<Element> _pickMember(ClassElement clazz, Iterable<Element> members) =>
    members
        .where((member) => memberInclude.shouldInclude(clazz, member, null))
        .toList();

class _MemberVisitor extends SimpleElementVisitor {
  List<Element> _members = [];

  @override
  dynamic visitFieldElement(FieldElement element) {
    _members.add(element);
  }

  @override
  dynamic visitMethodElement(MethodElement element) {
    _members.add(element);
  }

  /// collect element from [clazz]
  List<Element> collectMember(ClassElement classElement) {
    classElement.visitChildren(this);
    return _members;
  }
}
