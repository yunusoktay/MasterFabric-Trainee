// Day 4: Dart Fundamentals - Review and Practice
//
// Usage:
//   dart run dart/day_004.dart              -> runs both challenges
//   dart run dart/day_004.dart fizzbuzz     -> FizzBuzz only
//   dart run dart/day_004.dart guess        -> guessing game (random target)
//   dart run dart/day_004.dart guess 42     -> guessing game (fixed target)

import 'dart:io';
import 'dart:math';

const int minNumber = 1;
const int maxNumber = 100;

void main(List<String> args) {
  final String command = args.isNotEmpty ? args.first : 'all';
  final List<String> restArgs = args.length > 1 ? args.sublist(1) : [];

  switch (command) {
    case 'fizzbuzz':
      runFizzBuzz();
    case 'guess':
      runGuessingGame(restArgs);
    default:
      runFizzBuzz();
      print('');
      runGuessingGame(restArgs);
  }
}

void runFizzBuzz() {
  print('FizzBuzz Challenge');

  for (int number = 1; number <= 100; number++) {
    if (number % 15 == 0) {
      print('FizzBuzz');
    } else if (number % 3 == 0) {
      print('Fizz');
    } else if (number % 5 == 0) {
      print('Buzz');
    } else {
      print(number);
    }
  }
}

void runGuessingGame(List<String> restArgs) {
  final int targetNumber = _resolveTargetNumber(restArgs);
  int attempts = 0;

  print('Number Guessing Game');
  print('I picked a number between $minNumber and $maxNumber.');
  print('Type your guess and press Enter.');

  while (true) {
    stdout.write('Your guess: ');
    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Please enter a number.');
      continue;
    }

    final int? guess = int.tryParse(input.trim());

    if (guess == null) {
      print('That is not a valid integer.');
      continue;
    }

    if (guess < minNumber || guess > maxNumber) {
      print('Pick a number between $minNumber and $maxNumber.');
      continue;
    }

    attempts++;

    if (guess < targetNumber) {
      print('Too low. Try again.');
    } else if (guess > targetNumber) {
      print('Too high. Try again.');
    } else {
      print('Correct! You found the number in $attempts attempts.');
      break;
    }
  }
}

int _resolveTargetNumber(List<String> args) {
  final int? customTarget = args.isNotEmpty ? int.tryParse(args.first) : null;

  if (customTarget != null &&
      customTarget >= minNumber &&
      customTarget <= maxNumber) {
    return customTarget;
  }

  return Random().nextInt(maxNumber - minNumber + 1) + minNumber;
}
