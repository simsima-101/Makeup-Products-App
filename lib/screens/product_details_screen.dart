import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider for state management
import 'package:glamup/models/product.dart'; // Import the Product model
import 'package:glamup/view_models/cart_view_model.dart'; // Import the CartViewModel for managing cart operations

// A stateless widget that displays details of a selected product
class ProductDetailsScreen extends StatelessWidget {
  final Product product; // The product to display details for

  // Constructor to initialize the ProductDetailsScreen with the required product
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displaying the product's title
      appBar: AppBar(title: Text(product.title)),
      // Main body of the screen
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Adds padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Aligns content to the start of the column
          children: [
            // Centered image of the product
            Center(
              child: Image.network(
                product.imageUrl, // The product's image URL
                height: 200, // Fixed height for the image
                fit: BoxFit
                    .cover, // Ensures the image covers the given space proportionally
                loadingBuilder: (context, child, loadingProgress) {
                  // Displays a loading spinner while the image is loading
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  // Displays a placeholder icon if the image fails to load
                  return const Icon(Icons.broken_image, size: 100);
                },
              ),
            ),
            const SizedBox(height: 16), // Adds vertical spacing

            // Displays the product's title in bold, larger font
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Adds vertical spacing

            // Displays the product's description
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16), // Adds vertical spacing

            // Displays the product's price in bold with a green color
            Text(
              '\$${product.price.toStringAsFixed(2)}', // Formats the price to 2 decimal places
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24), // Adds vertical spacing

            // "Add to Cart" button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Adds the product to the cart using the CartViewModel
                  Provider.of<CartViewModel>(context, listen: false)
                      .addToCart(product);

                  // Shows a confirmation message as a snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart')),
                  );
                },
                // Button label
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.black), // Black text on the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
