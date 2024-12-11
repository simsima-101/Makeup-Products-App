// Defines a Product class that represents the structure of a product object.
class Product {
  // The title of the product.
  final String title;

  // The URL of the product's image.
  final String imageUrl;

  // A description of the product.
  final String description;

  // The price of the product.
  final double price;

  // Constructor to initialize a Product object with required fields.
  Product({
    required this.title, // The title of the product.
    required this.imageUrl, // The image URL of the product.
    required this.description, // A short description of the product.
    required this.price, // The price of the product as a double.
  });

  // Factory constructor to create a Product object from JSON data.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title:
          json['title'], // Maps the 'title' key from JSON to the title field.
      imageUrl:
          json['thumbnail'], // Maps the 'thumbnail' key to the imageUrl field.
      description: json[
          'description'], // Maps the 'description' key to the description field.
      price: (json['price'] as num)
          .toDouble(), // Maps 'price' from JSON, ensuring it's converted to double.
    );
  }
}
