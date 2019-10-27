import 'package:example/example.dart';
import 'package:test/test.dart';

void main() {
  test('Test generated toString()', () {
    var cat = Cat(color: "black", weight: 1.8, wings: null);
    expect("Cat{classify: Animal, color: black, weight: 1.8, wings: null}",
        cat.toString());
  });
}
