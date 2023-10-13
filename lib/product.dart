class Product {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;
  final int quantity;
  final String sellerName;

  Product({
    required this.quantity ,
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.sellerName,
  });

  @override
  String toString() {
    return
    '''
    id: $id
    Name:$name
    Price:$price
    Image Url: $imageUrl
    Description: $description 
    Seller Name: $sellerName
    ..........
    ''';
  }
}
