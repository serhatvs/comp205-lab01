// Part 4 - YOU write the tests here (at least 3 more tests).
//
// Ideas:
//  - fetchAll keeps the order of the names
//  - withFallback returns the task's result when it succeeds
//  - withFallback returns 'offline' when the task throws
//  - withFallback uses a custom fallback value
import 'package:lab01_dart/part4_async.dart';
import 'package:test/test.dart';

void main() {
  // Example: an async test. Note `async` and `await`.
  test('fetchGreeting returns a greeting', () async {
    expect(await fetchGreeting('Ada', delay: Duration.zero), 'Hello, Ada');
  });

  // TODO(4.4): add your tests below.
  test('fetchAll keeps the order of the names', () async {
    final names = ['Alice', 'Bob', 'Charlie'];
    final greetings = await fetchAll(names);
    expect(greetings, ['Hello, Alice', 'Hello, Bob', 'Hello, Charlie']);
  });

  test('withFallback returns the task result when it succeeds', () async {
    final result = await withFallback(() async => 'online');
    expect(result, 'online');
  });

  test('withFallback returns offline when the task throws', () async {
    final result = await withFallback(() async => throw Exception('no network'));
    expect(result, 'offline');
  });

  test('withFallback uses a custom fallback value', () async {
    final result = await withFallback(
      () async => throw Exception('server error'),
      fallback: 'error: unavailable',
    );
    expect(result, 'error: unavailable');
  });
}
