# 1.3.0
- Updated package dependencies

# 1.2.1
- Fix: Only field with it type annotated `ToString()` can be wrapped output in pretty print.

# 1.2.0+1
- Supports pretty print with annotation `ToString()` or `build.yaml`

# 1.1.0
- Private or static field and getter with `ToString()` will be shown in 
method `toString()`

- Public field, private or static field and getter with `ToString()` in 
supper class and mixin class with `ToString()`, will be shown in their
base class method `toString`

# 1.0.1

- Fix bug setter is generated incorrectly.

# 1.0.0

- Annotate `ToString()` to getter to let it show in `toString()`

# 0.1.0

- Stable release

# 0.0.1

- Add `ToString` annotation for generating `toString()`
