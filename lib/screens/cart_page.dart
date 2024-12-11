import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glamup/view_models/cart_view_model.dart';

// A stateless widget representing the Cart Page.
// It displays the user's cart items and provides options to remove items or proceed to checkout.
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the CartViewModel using the Provider package to manage cart state.
    final cart = Provider.of<CartViewModel>(context);

    return Scaffold(
      // App bar with the title "Your Cart".
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),

      // Body of the page:
      // If the cart is empty, show a message.
      // Otherwise, display a list of items in the cart.
      body: cart.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              // The number of items in the cart.
              itemCount: cart.cartItems.length,

              // A builder function to create a widget for each cart item.
              itemBuilder: (context, index) {
                // Accessing the current product in the cart.
                final product = cart.cartItems[index];

                return ListTile(
                  // Displaying the product image as the leading element.
                  leading: Image.network(
                    product.imageUrl, // URL of the product image.
                    width: 50,
                    height: 50,
                    fit: BoxFit
                        .cover, // Ensures the image fits the box dimensions.
                  ),

                  // Displaying the product title as the main title.
                  title: Text(product.title),

                  // Displaying the product price as a subtitle.
                  subtitle: Text('\$${product.price}'),

                  // A delete button to remove the item from the cart.
                  trailing: IconButton(
                    icon: const Icon(Icons.delete), // Trash icon for deletion.

                    onPressed: () {
                      // Removing the product from the cart.
                      cart.removeFromCart(product);

                      // Showing a SnackBar notification to confirm removal.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} removed from cart'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

      // Bottom navigation bar containing the "Buy Now" button.
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            // Placeholder for buy functionality (to be implemented).
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Proceeding to checkout...')),
            );
          },

          // Label of the button with styling.
          child: const Text(
            'Buy Now',
            style: TextStyle(
              fontSize: 14, // Font size of the button text.
              fontWeight: FontWeight.bold, // Bold text.
              color: Colors.black, // Text color.
            ),
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white10, // Button background color.
            padding: const EdgeInsets.symmetric(
              vertical: 5, // Vertical padding of the button.
              horizontal: 12, // Horizontal padding of the button.
            ),

            // Adding rounded corners to the button.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
