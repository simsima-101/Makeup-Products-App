import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:glamup/view_models/product_view_model.dart';
import 'package:glamup/view_models/cart_view_model.dart';
import 'package:glamup/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Makeup Products',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(), // Start with the LoginScreen
      ),
    );
  }
}
