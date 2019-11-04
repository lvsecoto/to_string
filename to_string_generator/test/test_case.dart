import 'package:source_gen_test/annotations.dart';
import 'package:to_string/to_string.dart';

@ShouldGenerate(r"""
String _$PublicFieldIncludeDefaultToString(PublicFieldIncludeDefault o) {
  return "PublicFieldIncludeDefault{publicField: ${o.publicField}}";
}
""")
@ToString()
class PublicFieldIncludeDefault {
  static var staticPublicField;

  // ignore: unused_field
  static var _staticPrivateField;

  static void staticPublicMethod() {}

  // ignore: unused_element
  static void _staticPrivateMethod() {}

  static String get staticGetter => "static getter";

  // ignore: unused_element
  static String get _privateStaticGetter => "static privite getter";

  static set staticSetter(String value) {}

  // ignore: unused_element
  static set _staticPrivateSetter(String value) {}

  var publicField;

  // ignore: unused_field
  var _privateField;

  void publicMethod() {}

  // ignore: unused_element
  void _privateMethod() {}

  String get getter => "getter";

  // ignore: unused_element
  String get _privateGetter => "private getter";

  set setter(String value) {}

  // ignore: unused_element
  set _setter(String value) {}
}

@ShouldGenerate(r"""
String _$IncludeGetterWithAnnotationToString(IncludeGetterWithAnnotation o) {
  return "IncludeGetterWithAnnotation{staticPublicField: ${o.staticPublicField}, _staticPrivateField: ${o._staticPrivateField}, publicField: ${o.publicField}, _privateField: ${o._privateField}, staticGetter: ${o.staticGetter}, _privateStaticGetter: ${o._privateStaticGetter}, getter: ${o.getter}, _privateGetter: ${o._privateGetter}}";
}
""")
@ToString()
class IncludeGetterWithAnnotation {
  @ToString()
  static var staticPublicField;

  @ToString()
  // ignore: unused_field
  static var _staticPrivateField;

  @ToString()
  static void staticPublicMethod() {}

  @ToString()
  // ignore: unused_element
  static void _staticPrivateMethod() {}

  @ToString()
  static String get staticGetter => "static getter";

  @ToString()
  // ignore: unused_element
  static String get _privateStaticGetter => "static privite getter";

  @ToString()
  static set staticSetter(String value) {}

  @ToString()
  // ignore: unused_element
  static set _staticPrivateSetter(String value) {}

  @ToString()
  var publicField;

  @ToString()
  // ignore: unused_field
  var _privateField;

  @ToString()
  void publicMethod() {}

  @ToString()
  // ignore: unused_element
  void _privateMethod() {}

  @ToString()
  String get getter => "getter";

  @ToString()
  // ignore: unused_element
  String get _privateGetter => "private getter";

  @ToString()
  set setter(String value) {}

  @ToString()
  // ignore: unused_element
  set _setter(String value) {}
}
