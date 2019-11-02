import 'dart:io';

import 'package:path/path.dart' as p;

main(List<String> arguments) async {
  await init();
  await testPackage("to_string_generator");
}

String get pub {
  if (Platform.isWindows) {
    return "pub.bat";
  } else {
    return "pub";
  }
}

Future<void> init() async {
  Directory.current = Directory.current.parent;
}

Future<void> testPackage(String packageName) async {
  print("== test: [$packageName] ==");

  print("pub get");
  (await run(pub, 'get'.split(" "), cd: packageName));

  print("pub run test");
  (await run(pub, 'run test'.split(" "), cd: packageName));

  print("== test: [$packageName] finished ==");
}

Future<dynamic> run(String executable, List<String> arguments, {String cd}) =>
    Process.start(executable, arguments, workingDirectory: p.absolute(cd))
        .then((result) {
      stdout.addStream(result.stdout);
      stderr.addStream(result.stderr);
      return result.exitCode;
    }).then((exitCode) {
      if (exitCode != 0) {
        exit(exitCode);
      }
    });
