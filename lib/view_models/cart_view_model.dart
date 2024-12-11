import 'package:flutter/material.dart'; // Import for Material Design widgets and utilities
import 'package:glamup/models/product.dart'; // Import the Product model

// ViewModel class to manage the state of the shopping cart
class CartViewModel extends ChangeNotifier {
  // Private list to hold the products added to the cart
  final List<Product> _cartItems = [];

  // Getter to provide read-only access to the cart items
  List<Product> get cartItems => _cartItems;

  // Method to add a product to the cart
  void addToCart(Product product) {
    _cartItems.add(product); // Add the product to the cart
    notifyListeners(); // Notify listeners about the change in cart items
  }

  // Method to remove a product from the cart
  void removeFromCart(Product product) {
    _cartItems.remove(product); // Remove the product from the cart
    notifyListeners(); // Notify listeners about the updated cart items
  }

  // Method to clear all items from the cart
  void clearCart() {
    _cartItems.clear(); // Remove all items from the cart
    notifyListeners(); // Notify listeners about the empty cart
  }
}
