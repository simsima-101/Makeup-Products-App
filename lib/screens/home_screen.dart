import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glamup/view_models/product_view_model.dart';
import 'package:glamup/screens/product_details_screen.dart';
import 'package:glamup/screens/cart_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductViewModel>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Makeup Products',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Changed to white background color
        child: Consumer<ProductViewModel>(
          builder: (context, model, child) {
            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (model.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  model.errorMessage,
                  style: const TextStyle(
                      color: Colors.white), // Adjusted to improve visibility
                ),
              );
            }

            if (model.products.isEmpty) {
              return const Center(child: Text('No products available.'));
            }

            return ListView.builder(
              itemCount: model.products.length,
              itemBuilder: (context, index) {
                final product = model.products[index];
                return ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
