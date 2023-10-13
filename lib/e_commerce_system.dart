import 'dart:io';
import 'package:e_commerce_system/category.dart';
import 'package:e_commerce_system/customer.dart';
import 'package:e_commerce_system/product.dart';
import 'package:e_commerce_system/seller.dart';
import 'package:e_commerce_system/customer_opertations.dart';
import 'package:e_commerce_system/cart.dart';
import 'package:e_commerce_system/seller_operations.dart';
import 'customer.dart';

class ECommerceSystem {
  static List<Product> allProducts = [];
  static List<Seller> allSellers = [];
  static List<Customer> customers = [];
  static List<Category> categories = [];

  static String getUserInput(String prompt) {
    print(prompt);
    return stdin.readLineSync()!;
  }


  void customerRegister() {
    print('Enter Name:');
    String name = stdin.readLineSync()!;
    print('Enter phoneNum:');
    String phoneNum = stdin.readLineSync()!;
    print('Enter Gender:');
    String gender = stdin.readLineSync()!;
    print('Enter age:');
    int? age = int.parse(stdin.readLineSync()!);
    print('Enter address:');
    String address = stdin.readLineSync()!;
    print('Enter email:');
    String email = stdin.readLineSync()!;
    print('Enter password:');
    String password = stdin.readLineSync()!;
    int customerNum = ECommerceSystem.customers.length;
    try {
      Customer customer = Customer(
        cart: Cart(),
        customerId: customerNum.toString(),
        name: name,
        age: age,
        gender: gender,
        phoneNum: phoneNum,
        email: email,
        password: password,
        address: address,
      );
      ECommerceSystem.customers.add(customer);
      print('Success Register');
      CustomerOperations.customerOperations(customer);
    } catch (e) {
      print(e.toString());
      return customerRegister();
    }
  }

  void customerValidation(String email, String password) {
    try {
      Customer? currentCustomer = ECommerceSystem.customers.firstWhere(
              (customer) =>
          customer.email == email && customer.password == password);

      print('Success Register');
      CustomerOperations.customerOperations(currentCustomer);
    } catch (e) {
      print('wrong information, please try again\n...........................');

    }
  }

  void sellerRegister() {
    print('Enter Name:');
    String name = stdin.readLineSync()!;
    print('Enter phoneNum:');
    String phoneNum = stdin.readLineSync()!;
    print('Enter Gender:');
    String gender = stdin.readLineSync()!;
    print('Enter age:');
    int? age = int.parse(stdin.readLineSync()!);
    print('Enter address:');
    String address = stdin.readLineSync()!;
    print('Enter email:');
    String email = stdin.readLineSync()!;
    print('Enter password:');
    String password = stdin.readLineSync()!;
    int sellerNum = ECommerceSystem.allSellers.length;
    try {
      Seller seller = Seller(
        sellerId: sellerNum.toString(),
        name: name,
        age: age,
        gender: gender,
        phoneNum: phoneNum,
        email: email,
        password: password,
        address: address,
      );
      ECommerceSystem.allSellers.add(seller);
      print('Success Register');
      SellerOperations.sellerOperation(seller);
    } catch (e) {
      print(e.toString());
      return sellerRegister();
    }
  }

  void sellerValidation(String email, String password) {
    try {
      Seller? currentSeller = ECommerceSystem.allSellers.firstWhere(
            (customer) => customer.email == email && customer.password == password,
      );
      print('Success Register');
      SellerOperations.sellerOperation(currentSeller);
    } catch (e) {
      print('wrong information, please try again\n.........................');
    }
  }

  void eCommercePage() {
    print('Welcome to our onlineShop:');
    print('What do you need?');
    print('1-Register as Seller');
    print('2-Login as Seller');
    print('3-Register as Customer');
    print('4-Login as Customer');
    print('5-Exit');
    int? registerType = int.parse(stdin.readLineSync() ?? '');

    switch (registerType) {
      case 1:
        sellerRegister();
        return eCommercePage();
      case 2:
        print('Enter Your email:');
        String email = stdin.readLineSync()!;
        print('Enter Your password:');
        String password = stdin.readLineSync()!;
        sellerValidation(email, password);
        return eCommercePage();
      case 3:
        customerRegister();
        return eCommercePage();
      case 4:
        print('Enter Your email:');
        String email = stdin.readLineSync()!;
        print('Enter Your password:');
        String password = stdin.readLineSync()!;
        customerValidation(email, password);
        return eCommercePage();
      case 5:
        print('Thank you for using our system.');
        break;
      default:
        print('Please select a correct number.');
        eCommercePage();
    }
  }
}