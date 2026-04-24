// Day 15: Asynchronous Programming - Practice
//
// Usage:
//   dart run dart/day_015.dart

Future<void> main() async {
  print('Day 15: Async Practice');
  print('');

  await runFakeApiDemo();
  print('');
  await runCountdownDemo();
  print('');
  await runCombinedDemo();
}

Future<Map<String, String>> fetchUserProfile() async {
  await Future.delayed(const Duration(seconds: 2));
  return {
    'name': 'Yunus Oktay',
    'email': 'yunus@example.com',
  };
}

Stream<int> countdownStream(int from) async* {
  for (int i = from; i >= 1; i--) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Future<void> runFakeApiDemo() async {
  print('1. Fake API Fetch');

  print('  fetching user profile...');
  final Map<String, String> profile = await fetchUserProfile();
  print('  name:  ${profile['name']}');
  print('  email: ${profile['email']}');
}

Future<void> runCountdownDemo() async {
  print('2. Countdown Stream');

  await for (final int value in countdownStream(5)) {
    print('  $value');
  }
  print('  liftoff!');
}

Future<void> runCombinedDemo() async {
  print('3. Countdown then Fetch');

  await for (final int value in countdownStream(3)) {
    print('  countdown: $value');
  }
  print('  countdown done, fetching profile...');

  final Map<String, String> profile = await fetchUserProfile();
  print('  name:  ${profile['name']}');
  print('  email: ${profile['email']}');
}
