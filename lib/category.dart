import 'package:e_commerce_system/product.dart';

class Category {
  final String categoryName;
  final List<Product> products;

  Category({
    required this.categoryName,
    this.products = const [],
  });

  void addProduct(Product product) {
    products.add(product);
  }

  @override
  String toString() {
    return 'Category name: $categoryName\nproducts: $products';
  }
}