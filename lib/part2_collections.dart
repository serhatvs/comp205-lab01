// Part 2 - Collections: List, Map, records, collection-if and spread.

/// Returns only the even numbers of [numbers], in the same order.
List<int> evens(List<int> numbers) {
  return numbers.where((n) => n % 2 == 0).toList();
}

/// Counts how often each word appears in [text].
///
/// Words are separated by whitespace (spaces, tabs, new lines).
/// Counting is case-insensitive: "The" and "the" are the same word.
/// Example: "The cat the" -> {"the": 2, "cat": 1}
Map<String, int> wordCount(String text) {
  Map<String, int> counts = {};
  String cleaned = text.trim();
  if (cleaned.isEmpty) {
    return counts;
  }
  List<String> words = cleaned.toLowerCase().split(RegExp(r'\s+'));
  for (String word in words) {
    counts[word] = (counts[word] ?? 0) + 1;
  }
  return counts;
}

/// Returns the smallest and the largest value of [numbers] as a record.
///
/// Throws an [ArgumentError] if [numbers] is empty.
(int, int) minMax(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError('numbers cannot be empty');
  }
  int min = numbers[0];
  int max = numbers[0];
  for (int n in numbers) {
    if (n < min) {
      min = n;
    }
    if (n > max) {
      max = n;
    }
  }
  return (min, max);
}

/// Builds the items of an app menu.
///
/// The list always starts with "Home".
/// "Admin" comes next, but only if [isAdmin] is true.
/// All [extras] are added at the end, in order.
/// Use collection-if and the spread operator (...).
List<String> buildMenu({bool isAdmin = false, List<String> extras = const []}) {
  return [
    'Home',
    if (isAdmin) 'Admin',
    ...extras,
  ];
}
