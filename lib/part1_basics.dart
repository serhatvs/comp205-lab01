// Part 1 - Basics: strings, null safety, named parameters.
// Replace every `throw UnimplementedError(...)` with your own code.

/// Returns a greeting such as "Hello, Ada!".
///
/// [greeting] is optional and defaults to "Hello".
/// If [excited] is true, the greeting ends with "!!!" instead of "!".
String greet(String name, {String greeting = 'Hello', bool excited = false}) {
  if (excited) {
    return '$greeting, $name!!!';
  } else {
    return '$greeting, $name!';
  }
}

/// Parses [input] into an age.
///
/// Spaces around the number are allowed: " 21 " -> 21.
/// Returns null if [input] is not a whole number or is negative.
int? parseAge(String input) {
  int? age = int.tryParse(input.trim());
  if (age == null) {
    return null;
  }
  if (age < 0) {
    return null;
  }
  return age;
}

/// Describes an age group:
/// null -> "unknown", 0-12 -> "child", 13-17 -> "teen", 18 or more -> "adult".
String describeAge(int? age) {
  if (age == null) {
    return 'unknown';
  } else if (age < 13) {
    return 'child';
  } else if (age < 18) {
    return 'teen';
  } else {
    return 'adult';
  }
}

/// Returns the length of [text], or 0 if [text] is null.
///
/// Use null-aware operators (?. and ??), not an if statement.
int safeLength(String? text) {
  return text?.length ?? 0;
}
