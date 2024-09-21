class Product {
  final String slug;
  final String name;
  final String image;
  final String price;
  final String manufacturer;
  final String symbolLeft;

  Product({
    required this.slug,
    required this.name,
    required this.image,
    required this.price,
    required this.manufacturer,
    required this.symbolLeft,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      slug: json['slug'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      manufacturer: json['manufacturer'],
      symbolLeft: json['symbol_left'],
    );
  }
}