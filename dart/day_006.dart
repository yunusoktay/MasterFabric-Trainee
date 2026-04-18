// Day 6: Dart Advanced & OOP - Introduction to Classes
//
// Usage:
//   dart run dart/day_006.dart

void main() {
  print('Day 6: Introduction to Classes');
  print('');

  final student = Student(
    name: 'Yunus',
    age: 28,
    favoriteTopic: 'Dart classes',
  );
  
  print('1. Create Objects');
  student.introduce();
  student.study();
  print('');

  print('2. Update a Property With a Method');
  student.completeLesson('Constructors'); // state mutation
  student.study();
}

class Student {
  final String name;
  final int age;
  String favoriteTopic;

  Student({required this.name, required this.age, required this.favoriteTopic});

  void introduce() {
    print('Hi, my name is $name. I am $age years old.');
  }

  void study() {
    print('$name is studying $favoriteTopic today.');
  }

  void completeLesson(String nextTopic) {
    print('$name completed $favoriteTopic.');
    favoriteTopic = nextTopic;
  }
}
