import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string_generator/src/to_string_generator.dart';

Builder toString(BuilderOptions options) =>
    SharedPartBuilder([const ToStringGenerator()], 'to_string');