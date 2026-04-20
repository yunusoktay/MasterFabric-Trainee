// Day 10: Dart Advanced & OOP - Collections
//
// Usage:
//   dart run dart/day_010.dart

void main() {
  print('Day 10: Collections');
  print('');

  runListDemo();
  print('');
  runMapDemo();
}

void runListDemo() {
  print('1. List');

  final List<String> fruits = ['apple', 'banana', 'cherry'];
  print('Initial list: $fruits');

  fruits.add('date');
  print('After add: $fruits');

  fruits.remove('banana');
  print('After remove: $fruits');

  print('First item (index 0): ${fruits[0]}');
  print('Length: ${fruits.length}');

  print('Iterating with for-in:');
  for (final fruit in fruits) {
    print('- $fruit');
  }

  print('Iterating with forEach:');
  fruits.forEach((fruit) => print('* $fruit'));
}

void runMapDemo() {
  print('2. Map');

  final Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };
  print('Initial map: $ages');

  ages['Diana'] = 28;
  print('After add: $ages');

  ages.remove('Bob');
  print('After remove: $ages');

  print("Alice's age: ${ages['Alice']}");
  print('Keys: ${ages.keys}');
  print('Values: ${ages.values}');

  print('Iterating with forEach:');
  ages.forEach((name, age) => print('- $name is $age years old'));
}
