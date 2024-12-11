import 'package:flutter/material.dart'; // Importing Flutter's Material package for UI components
import 'package:provider/provider.dart'; // Importing Provider for state management

// Importing custom ViewModels for managing state
import 'package:glamup/view_models/product_view_model.dart';
import 'package:glamup/view_models/cart_view_model.dart';

// Importing the LoginScreen as the starting point of the app
import 'package:glamup/screens/login_screen.dart';

// Entry point of the Flutter application
void main() {
  runApp(MyApp()); // Runs the app by calling the MyApp widget
}

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // MultiProvider is used to provide multiple ChangeNotifierProviders
      providers: [
        // Provider for ProductViewModel to manage product-related state
        ChangeNotifierProvider(create: (_) => ProductViewModel()),

        // Provider for CartViewModel to manage cart-related state
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:
            false, // Disables the debug banner in the top-right corner
        title: 'Makeup Products', // Sets the title of the application
        theme: ThemeData(
            primarySwatch:
                Colors.blue), // Sets the app's theme with a blue color scheme
        home:
            LoginScreen(), // Sets LoginScreen as the initial screen of the app
      ),
    );
  }
}
