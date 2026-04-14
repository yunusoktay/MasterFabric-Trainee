// Day 5: Simple Command-Line Calculator
//
// Usage:
//   dart run dart/day_005.dart

import 'dart:io';

void main() {
  print('Simple Calculator');
  print('');

  final double? a = _readNumber('Enter first number: ');
  if (a == null) return;

  final String? operator = _readOperator();
  if (operator == null) return;

  final double? b = _readNumber('Enter second number: ');
  if (b == null) return;

  final double? result = _calculate(a, operator, b);
  if (result == null) {
    print('Error: Cannot divide by zero.');
    return;
  }

  print('Result: $a $operator $b = $result');
}

double? _readNumber(String prompt) {
  stdout.write(prompt);
  final input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Error: No input provided.');
    return null;
  }

  final number = double.tryParse(input.trim());
  if (number == null) {
    print('Error: "$input" is not a valid number.');
  }
  return number;
}

String? _readOperator() {
  const validOperators = ['+', '-', '*', '/'];

  stdout.write('Enter operator (+, -, *, /): ');
  final input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Error: No input provided.');
    return null;
  }

  final op = input.trim();
  if (!validOperators.contains(op)) {
    print('Error: "$op" is not a valid operator.');
    return null;
  }
  return op;
}

double? _calculate(double a, String operator, double b) {
  switch (operator) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b == 0) return null;
      return a / b;
    default:
      return null;
  }
}
