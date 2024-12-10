class Product {
  final String title;
  final String imageUrl;
  final String description;
  final double price;

  Product({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      imageUrl: json['thumbnail'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
