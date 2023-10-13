import 'package:e_commerce_system/product.dart';

class Cart{

  final List<Product> cartProduct =[];

  void addToCart(Product product){
    cartProduct.add(product);
  }

  void removeFromCart(Product product){
    cartProduct.remove(product);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var product in cartProduct) {
      totalPrice += product.price ;
    }
    return totalPrice;
  }





}