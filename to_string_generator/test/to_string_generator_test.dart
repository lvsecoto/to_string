import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:to_string/to_string.dart';
import 'package:to_string_generator/src/to_string_generator.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
      'test/example', 'example_test_src.dart');

  initializeBuildLogTracking();
  testAnnotatedElements<ToString>(
    reader,
    const ToStringGenerator()
  );
}

