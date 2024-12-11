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
    // Fetches the list of products as soon as the screen is initialized.
    // Using Future.microtask ensures that fetchProducts() is executed after the widget tree has been built.
    Future.microtask(() =>
        Provider.of<ProductViewModel>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar with the title of the app
        title: const Text(
          'Makeup Products',
          style: TextStyle(color: Colors.black), // Styling the title text
        ),
        actions: [
          // Shopping cart icon that navigates to the CartPage when clicked
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
        color: Colors.white, // Sets the background color to white
        child: Consumer<ProductViewModel>(
          // Consumer listens to changes in ProductViewModel and rebuilds this widget accordingly
          builder: (context, model, child) {
            if (model.isLoading) {
              // Displays a loading indicator while products are being fetched
              return const Center(child: CircularProgressIndicator());
            }

            if (model.errorMessage.isNotEmpty) {
              // Displays an error message if there was an issue fetching products
              return Center(
                child: Text(
                  model.errorMessage,
                  style: const TextStyle(
                      color: Colors.white), // Styling the error message
                ),
              );
            }

            if (model.products.isEmpty) {
              // Displays a message if no products are available
              return const Center(child: Text('No products available.'));
            }

            // Displays a list of products using ListView.builder
            return ListView.builder(
              itemCount:
                  model.products.length, // Number of products in the list
              itemBuilder: (context, index) {
                final product = model
                    .products[index]; // Gets the product at the current index
                return ListTile(
                  // Displays the product image on the left
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit
                        .cover, // Ensures the image fits correctly in the box
                  ),
                  // Displays the product title as the main text
                  title: Text(product.title),
                  // Displays the product price as the subtitle
                  subtitle: Text('\$${product.price}'),
                  // Navigates to the ProductDetailsScreen when the product is tapped
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
