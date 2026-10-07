// Part 4 - Asynchronous code with Future, async and await.

/// Simulates a slow network call.
///
/// Waits for [delay], then returns "Hello, <name>".
Future<String> fetchGreeting(
  String name, {
  Duration delay = const Duration(milliseconds: 50),
}) async {
  await Future.delayed(delay);
  return 'Hello, $name';
}

/// Fetches a greeting for every name in [names], one after another.
///
/// The results are returned in the same order as [names].
Future<List<String>> fetchAll(List<String> names) async {
  List<String> results = [];
  for (String name in names) {
    String greeting = await fetchGreeting(name);
    results.add(greeting);
  }
  return results;
}

/// Runs [task] and returns its result.
///
/// If [task] throws an error, returns [fallback] instead.
Future<String> withFallback(
  Future<String> Function() task, {
  String fallback = 'offline',
}) async {
  try {
    return await task();
  } catch (e) {
    return fallback;
  }
}
