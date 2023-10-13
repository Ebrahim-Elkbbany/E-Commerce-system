
import 'package:e_commerce_system/person.dart';
import 'package:e_commerce_system/product.dart';


class Seller extends Person {
   List<Product> sellerProducts = [];
  final String sellerId;
  Seller( {
    required this.sellerId,
    required super.name,
    required super.address,
    required super.age,
    required super.gender,
    required super.phoneNum,
    required super.email,
    required super.password,
  });


   void addProduct(Product product){
    sellerProducts.add(product);
  }

   void removeProduct(Product product){
    sellerProducts.remove(product);
  }

  @override
  String toString() {
    return '${super.toString()} \nSeller id:$sellerId';
  }

}
