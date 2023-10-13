import 'package:e_commerce_system/category.dart';
import 'package:e_commerce_system/customer.dart';
import 'package:e_commerce_system/order.dart';
import 'package:e_commerce_system/product.dart';
import 'package:e_commerce_system/e_commerce_system.dart';

class CustomerOperations {
  static void customerOperations(Customer customer) {
    print('What do you need?\n1-Browse all categories\n2-Browse all products\n3-Logout');
    int? num = int.parse(ECommerceSystem.getUserInput('Enter your choice:'));

    switch (num) {
      case 1:
        showCategories();
        productsOperations(customer);
        break;
      case 2:
        print('All Products:');
        for (var product in ECommerceSystem.allProducts) {
          print(product);
        }
        productsOperations(customer);
        break;
      case 3:
        break;
      default:
        print("Invalid choice, please enter a correct number");
        customerOperations(customer);
    }
  }

  static void productsOperations(Customer customer) {
    print('''
    What do you need?
    1-Add product to cart
    2-Remove product from cart
    3-Get Total Price 
    4-checkout and place order 
    5-Logout
    ''');
    int? num = int.parse(ECommerceSystem.getUserInput('Enter your choice:'));

    switch (num) {
      case 1:
        addProductToCart(customer);
        productsOperations(customer);
        break;
      case 2:
        CustomerOperations.removeProductFromCart(customer);
        productsOperations(customer);
        break;
      case 3:
        print("total price :${customer.cart.getTotalPrice()}");
        print('...........................');
        productsOperations(customer);
        break;
      case 4:
        print("total price :${customer.cart.getTotalPrice()}");
        checkoutAndPlaceOrder(customer);
        print('...........................');
        productsOperations(customer);
        break;
      case 5:
        break;
      default:
        print("Invalid choice, please enter a correct number");
        productsOperations(customer);
    }
  }

  static void addProductToCart(Customer customer) {
    String productId = ECommerceSystem.getUserInput('Please Enter Product Id:');
    Product selectedProduct = ECommerceSystem.allProducts.firstWhere(
          (product) => product.id == productId,
    );

    if (selectedProduct.id.isNotEmpty) {
      customer.cart.addToCart(selectedProduct);
      print(customer.cart.cartProduct);
      print('Success added to cart\n.........................................');
    } else {
      print('Product not found.');
    }
  }

  static void removeProductFromCart(Customer customer) {
    String productId = ECommerceSystem.getUserInput('Please Enter Product Id:');
    Product selectedProduct = ECommerceSystem.allProducts.firstWhere(
          (product) => product.id == productId,
    );

    if (selectedProduct.id.isNotEmpty) {
      customer.cart.removeFromCart(selectedProduct);
      print('Success removed product from cart\n...........................');
    } else {
      print('Product not found.');
    }
  }

  static void showCategories() {
    print('Categories:');
    for (var category in ECommerceSystem.categories) {
      print(category);
    }

    String categoryName = ECommerceSystem.getUserInput('What do you need? Enter category name:');
    Category selectedCategory = ECommerceSystem.categories.firstWhere(
          (c) => c.categoryName == categoryName,
      orElse: () => Category(categoryName: categoryName),
    );

    print('Products in category: $selectedCategory');
  }

  static void checkoutAndPlaceOrder(Customer customer) {
    if (customer.cart.cartProduct.isEmpty) {
      print('Your cart is empty. Add products to your cart first.');
    } else {
      Order(customer: customer, products: customer.cart.cartProduct, orderDate: DateTime.now());
      customer.cart.cartProduct.clear();
      print('Order placed successfully!');
    }
  }
}