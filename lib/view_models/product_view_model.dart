import 'dart:convert'; // Importing Dart's built-in library for JSON encoding/decoding
import 'package:flutter/material.dart'; // Importing Flutter's Material package for UI components
import 'package:glamup/models/product.dart'; // Importing the Product model
import 'package:http/http.dart'
    as http; // Importing HTTP package for making API requests

// ProductViewModel is responsible for managing the state of products in the application.
// It extends ChangeNotifier to enable state management with Provider.
class ProductViewModel extends ChangeNotifier {
  // Private list to store the fetched products
  List<Product> _products = [];
  // Boolean to indicate if the product fetching process is ongoing
  bool _isLoading = false;
  // String to store error messages encountered during the API call
  String _errorMessage = '';

  // Public getter to access the list of products
  List<Product> get products => _products;
  // Public getter to check if the product fetching process is ongoing
  bool get isLoading => _isLoading;
  // Public getter to access error messages
  String get errorMessage => _errorMessage;

  // Method to fetch products from an API
  Future<void> fetchProducts() async {
    // Set loading to true before initiating the API call and notify listeners
    _isLoading = true;
    notifyListeners();

    try {
      // Make a GET request to the dummy JSON API for fetching products
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=10'));

      // Check if the response status is OK (200)
      if (response.statusCode == 200) {
        // Parse the response body and convert it into a list of Product objects
        final data = json.decode(response.body);
        _products = (data['products'] as List)
            .map((product) =>
                Product.fromJson(product)) // Convert JSON to Product
            .toList();
      } else {
        // Set an error message if the response status is not OK
        _errorMessage = 'Failed to load products';
      }
    } catch (e) {
      // Handle any exceptions that occur during the API call
      _errorMessage = 'Error: $e';
    }

    // Set loading to false after the API call completes and notify listeners
    _isLoading = false;
    notifyListeners();
  }
}
