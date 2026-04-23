// Day 14: Asynchronous Programming - Introduction to Streams
//
// Usage:
//   dart run dart/day_014.dart

import 'dart:async';

Future<void> main() async {
  print('Day 14: Streams');
  print('');

  await runFromIterableDemo();
  print('');
  await runAsyncGeneratorDemo();
  print('');
  await runSubscriptionDemo();
  print('');
  await runCallbacksDemo();
}

Stream<int> countDownStream(int from) async* {
  for (int i = from; i >= 1; i--) {
    await Future.delayed(const Duration(milliseconds: 100));
    yield i;
  }
}

Stream<int> faultyStream() async* {
  yield 1;
  yield 2;
  throw StateError('something went wrong after 2');
}

Future<void> runFromIterableDemo() async {
  print('1. Stream.fromIterable');

  final Stream<String> fruits = Stream<String>.fromIterable([
    'apple',
    'banana',
    'cherry',
  ]);

  fruits.listen((fruit) => print('  received: $fruit'));

  await Future.delayed(const Duration(milliseconds: 50));
}

Future<void> runAsyncGeneratorDemo() async {
  print('2. async* generator');

  await for (final int value in countDownStream(3)) {
    print('  tick: $value');
  }
  print('  countdown finished');
}

Future<void> runSubscriptionDemo() async {
  print('3. StreamSubscription (pause / resume / cancel)');

  final Stream<int> ticks = Stream<int>.periodic(
    const Duration(milliseconds: 100),
    (count) => count + 1,
  );

  final StreamSubscription<int> subscription = ticks.listen(
    (tick) => print('  tick $tick'),
  );

  await Future.delayed(const Duration(milliseconds: 350));
  subscription.pause();
  print('  paused');

  await Future.delayed(const Duration(milliseconds: 300));
  subscription.resume();
  print('  resumed');

  await Future.delayed(const Duration(milliseconds: 250));
  await subscription.cancel();
  print('  cancelled');
}

Future<void> runCallbacksDemo() async {
  print('4. listen callbacks: onData / onError / onDone');

  final Completer<void> completer = Completer<void>();

  faultyStream().listen(
    (value) => print('  data: $value'),
    onError: (Object error) => print('  error: $error'),
    onDone: () {
      print('  done');
      completer.complete();
    },
    cancelOnError: false,
  );

  await completer.future;
}
