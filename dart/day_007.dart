// Day 7: Dart Advanced & OOP - Inheritance
//
// Usage:
//   dart run dart/day_007.dart

void main() {
  print('Day 7: Inheritance');
  print('');

  final vehicle = Vehicle(brand: 'Generic', speed: 60);
  final car = Car(brand: 'Tesla', speed: 120, numberOfDoors: 4);

  print('1. Superclass Object');
  vehicle.drive();
  vehicle.stop();
  print('');

  print('2. Subclass Object');
  car.drive();
  car.stop();
  print('');

  print('3. Subclass Specific Method');
  car.describeDoors();
}

class Vehicle {
  final String brand;
  final int speed;

  Vehicle({required this.brand, required this.speed});

  void drive() {
    print('$brand is driving at $speed km/h.');
  }

  void stop() {
    print('$brand has stopped.');
  }
}

class Car extends Vehicle {
  final int numberOfDoors;

  Car({
    required super.brand,
    required super.speed,
    required this.numberOfDoors,
  });

  @override
  void drive() {
    super.drive();
    print('$brand is a car with $numberOfDoors doors.');
  }

  void describeDoors() {
    print('This $brand has $numberOfDoors doors.');
  }
}
