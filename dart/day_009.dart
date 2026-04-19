// Day 9: Dart Advanced & OOP - Mixins
//
// Usage:
//   dart run dart/day_009.dart

void main() {
  print('Day 9: Mixins');
  print('');

  final bird = Bird(name: 'Sparrow');
  final plane = Plane(model: 'Boeing 747');

  print('1. Bird Uses Logger and Flyable');
  bird.log('Sparrow is about to take off.');
  bird.fly();
  print('');

  print('2. Plane Uses the Same Mixins');
  plane.log('Boeing 747 preparing for takeoff.');
  plane.fly();
}

mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

mixin Flyable {
  void fly() {
    print('Flying through the sky!');
  }
}

class Bird with Logger, Flyable {
  final String name;

  Bird({required this.name});
}

class Plane with Logger, Flyable {
  final String model;

  Plane({required this.model});
}
