import 'package:source_gen/source_gen.dart';
import 'package:source_gen_test/annotations.dart';
import 'package:to_string/to_string.dart';

@ShouldGenerate(
  """
String _\$toString(Cat o) {
  return "Cat{color: \${o.color}}";
}
"""
)
@ToString()
class Cat {
  var color = "black";
}
