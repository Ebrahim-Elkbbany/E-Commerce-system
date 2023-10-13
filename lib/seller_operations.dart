import 'package:e_commerce_system/category.dart';
import 'package:e_commerce_system/product.dart';
import 'package:e_commerce_system/seller.dart';
import 'package:e_commerce_system/e_commerce_system.dart';

class SellerOperations {
  static void sellerOperation(Seller seller) {
    print("What do you need?\n1-Add Product\n2-Remove Product\n3-Exit");
    int? num = int.parse(ECommerceSystem.getUserInput('Enter your choice:'));

    switch (num) {
      case 1:
        SellerOperations.addProduct(seller);
        sellerOperation(seller);
        break;
      case 2:
        SellerOperations.removeProduct(seller);
        sellerOperation(seller);
        break;
      case 3:
        break;
      default:
        print("Invalid choice, please enter a correct number");
        sellerOperation(seller);
    }
  }

  static void addProduct(Seller seller) {
    print('Please Enter Product details:');
    String productId = ECommerceSystem.getUserInput('Product productId:');
    String name = ECommerceSystem.getUserInput('Name:');
    int price = int.parse(ECommerceSystem.getUserInput('Price:'));
    String imageUrl = ECommerceSystem.getUserInput('Image URL:');
    String description = ECommerceSystem.getUserInput('Description:');
    int quantity = int.parse(ECommerceSystem.getUserInput('Quantity:'));
    String categoryName = ECommerceSystem.getUserInput('Category Name:');
    Category category = ECommerceSystem.categories.firstWhere(
          (c) => c.categoryName == categoryName,
      orElse: () => Category(categoryName: categoryName,products: []),
    );

    Product product = Product(
      sellerName: seller.name,
      id: productId,
      name: name,
      price: price,
      imageUrl: imageUrl,
      description: description,
      quantity: quantity,
    );

    ECommerceSystem.allProducts.add(product);
    seller.addProduct(product);
    category.addProduct(product);

    print('Success added product\n.............................');
  }

  static void removeProduct(Seller seller) {
    print('Products: ${seller.sellerProducts}');
    String productId = ECommerceSystem.getUserInput('Please Enter Product id:');

    Product selectedProduct = ECommerceSystem.allProducts.firstWhere(
          (product) => product.id == productId,
    );

    if (selectedProduct.id.isNotEmpty) {
      ECommerceSystem.allProducts.remove(selectedProduct);
      seller.removeProduct(selectedProduct);
      print('Success removed product\n................................');
    } else {
      print('Product not found.');
    }
  }
}