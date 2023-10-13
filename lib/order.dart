import 'package:e_commerce_system/customer.dart';
import 'package:e_commerce_system/product.dart';

class Order {
  final Customer customer;
  final List<Product> products;
  final DateTime orderDate;

  Order({
    required this.customer,
    required this.products,
    required this.orderDate,
  });

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }
}
