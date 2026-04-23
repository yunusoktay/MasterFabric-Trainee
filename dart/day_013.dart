// Day 13: Asynchronous Programming - async and await
//
// Usage:
//   dart run dart/day_013.dart

import 'dart:math';

Future<void> main() async {
  print('Day 13: async and await');
  print('');

  await runAsyncBasicsDemo();
  print('');
  await runThenVsAwaitDemo();
  print('');
  await runTryCatchDemo();
  print('');
  await runSequentialVsParallelDemo();
}

Future<String> fetchUsername() async {
  await Future.delayed(const Duration(milliseconds: 200));
  return 'yunus';
}

Future<int> fetchAge() async {
  await Future.delayed(const Duration(milliseconds: 100));
  return 27;
}

Future<int> riskyOperation({required bool shouldFail}) async {
  await Future.delayed(const Duration(milliseconds: 50));
  if (shouldFail) {
    throw StateError('the operation failed');
  }
  return Random().nextInt(100);
}

Future<String> slowTask(String label, int ms) async {
  await Future.delayed(Duration(milliseconds: ms));
  return '$label-done';
}

Future<void> runAsyncBasicsDemo() async {
  print('1. async / await basics');

  print('  before await');
  final String username = await fetchUsername();
  print('  after await, got: $username');

  final int age = await fetchAge();
  print('  age: $age');
}

Future<void> runThenVsAwaitDemo() async {
  print('2. .then() vs. async/await');

  print('  -- .then() style --');
  await fetchUsername().then((name) {
    return fetchAge().then((years) {
      print('  $name is $years years old');
    });
  });

  print('  -- async/await style --');
  final String name = await fetchUsername();
  final int years = await fetchAge();
  print('  $name is $years years old');
}

Future<void> runTryCatchDemo() async {
  print('3. Error handling with try / catch');

  try {
    final int value = await riskyOperation(shouldFail: false);
    print('  success: value = $value');
  } catch (error) {
    print('  caught (should not happen): $error');
  }

  try {
    final int value = await riskyOperation(shouldFail: true);
    print('  success (should not happen): value = $value');
  } on StateError catch (error) {
    print('  caught StateError: ${error.message}');
  } catch (error) {
    print('  caught generic: $error');
  } finally {
    print('  finally block always runs');
  }
}

Future<void> runSequentialVsParallelDemo() async {
  print('4. Sequential vs. parallel');

  final Stopwatch sequential = Stopwatch()..start();
  final String a1 = await slowTask('A', 200);
  final String b1 = await slowTask('B', 200);
  final String c1 = await slowTask('C', 200);
  sequential.stop();
  print('  sequential: [$a1, $b1, $c1] in ${sequential.elapsedMilliseconds}ms');

  final Stopwatch parallel = Stopwatch()..start();
  final List<String> results = await Future.wait<String>([
    slowTask('A', 200),
    slowTask('B', 200),
    slowTask('C', 200),
  ]);
  parallel.stop();
  print('  parallel:   $results in ${parallel.elapsedMilliseconds}ms');
}
