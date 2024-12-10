import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glamup/models/product.dart';
import 'package:http/http.dart' as http;

class ProductViewModel extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch products from the API
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=10'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _products = (data['products'] as List)
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        _errorMessage = 'Failed to load products';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
