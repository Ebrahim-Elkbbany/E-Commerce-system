import 'package:e_commerce_system/cart.dart';
import 'package:e_commerce_system/category.dart';
import 'package:e_commerce_system/customer.dart';
import 'package:e_commerce_system/product.dart';
import 'package:e_commerce_system/seller.dart';
import 'package:e_commerce_system/e_commerce_system.dart';

main() {


  Customer customer = Customer(
    cart: Cart(),
    name: 'ahmed',
    customerId: '3030',
    phoneNum: '0000',
    age: 20,
    gender: 'male',
    address: 'man',
    email: 'ebrahim',
    password: '1907',
  );
  Customer customer1 = Customer(
    cart: Cart(),
    name: 'ahmed1',
    customerId: '3030',
    phoneNum: '0000',
    age: 20,
    gender: 'male',
    address: 'man',
    email: 'ebrahim1',
    password: '1907',
  );

  Seller seller = Seller(

    name: 'ahmed',
    sellerId: '3030',
    phoneNum: '0000',
    age: 20,
    gender: 'male',
    address: 'man',
    email: 'ebrahim',
    password: '1907',
  );
  Seller seller1 = Seller(

    name: 'ahmed',
    sellerId: '3030',
    phoneNum: '0000',
    age: 20,
    gender: 'male',
    address: 'man',
    email: 'ebrahim2',
    password: '1907',
  );


  Product product = Product(
    sellerName: 'h1',
    id: "productId",
    name: "name",
    price: 120,
    imageUrl: "imageUrl",
    description: "description",
    quantity: 10,
  );
  Product product1 = Product(
    sellerName: 'h1',
    id: "productId1",
    name: "name",
    price: 120,
    imageUrl: "imageUrl",
    description: "description",
    quantity: 10,
  );
  Product product2 = Product(
    sellerName: 'h1',
    id: "productId2",
    name: "name",
    price: 120,
    imageUrl: "imageUrl",
    description: "description",
    quantity: 10,
  );

  Category c = Category(categoryName: 'sss',products: [product,product1,product2]);
  Category c2 = Category(categoryName: 'as',products: [product,product1,product2]);
  ECommerceSystem.customers.add(customer);
  ECommerceSystem.customers.add(customer1);

  ECommerceSystem.allSellers.add(seller);
  ECommerceSystem.allSellers.add(seller1);

  ECommerceSystem.categories.add(c);
  ECommerceSystem.categories.add(c2);

  ECommerceSystem.allProducts.add(product);
  ECommerceSystem.allProducts.add(product1);
  ECommerceSystem.allProducts.add(product2);

  // all of this  to test only


  ECommerceSystem().eCommercePage();

}
