import 'package:source_gen_test/annotations.dart';
import 'package:to_string/to_string.dart';

@ShouldGenerate(r"""
String _$PublicFieldIncludeDefaultToString(PublicFieldIncludeDefault o) {
  return "PublicFieldIncludeDefault{publicField: ${o.publicField}}";
}
""")
@ToString()
class PublicFieldIncludeDefault {
  var publicField;
  // ignore: unused_field
  var _privateField;
  void publicMethod() {}
  // ignore: unused_element
  void _privateMethod() {}
  String get getter => "getter";
  set setter(String value) {}
}
