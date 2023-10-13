import 'package:e_commerce_system/cart.dart';
import 'package:e_commerce_system/person.dart';

class Customer extends Person {
  final String customerId;
  final Cart cart;

  Customer({
    required this.cart,
    required this.customerId,
    required super.name,
    required super.age,
    required super.gender,
    required super.phoneNum,
    required super.email,
    required super.password,
    required super.address,
  });

  @override
  String toString() {
    return '${super.toString()} \nCustomer id:$customerId';
  }
}
