abstract class Person{

  final String name;
  final int age;
  final String gender;
  final String address;
  final String phoneNum;
  final String email;
  final String password;

  Person(
      {required this.name,
        required this.address,
        required this.age,
        required this.gender,
        required this.phoneNum,
        required this.email,
        required this.password,
      });

  @override
  String toString() {
    return 'Name: $name\nAge: $age\nGender: $gender\nContact Info: $phoneNum \nEmail $email \n Address $address';
  }
}