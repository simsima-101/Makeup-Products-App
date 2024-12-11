import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Key to manage the state of the login form and perform validation
  final _formKey = GlobalKey<FormState>();

  // Controllers to handle user input for email and password fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    // Validates the form and navigates to the HomeScreen if valid
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with a gradient background
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(60), // Sets a specific height for the AppBar
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          centerTitle: true, // Centers the title text
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.all(16.0), // Adds padding around the content
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Aligns content horizontally
              children: [
                const SizedBox(height: 20), // Spacer for vertical alignment

                // App title displayed at the top
                const Text(
                  'makeupbox',
                  style: TextStyle(
                    fontSize: 40, // Large font size for visibility
                    fontStyle: FontStyle.normal,
                    color: Colors.black, // Black text color
                  ),
                ),

                const SizedBox(height: 90), // Spacer between title and form

                // Login form with validation
                Form(
                  key: _formKey, // Assigning the key for form validation
                  child: Column(
                    children: [
                      // Email input field with validation
                      Container(
                        width: 400, // Sets a fixed width for the input field
                        child: TextFormField(
                          controller: _emailController, // Binds the controller
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email,
                                color: Colors.black), // Icon for email
                            labelText: 'Email', // Label for the input field
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded borders
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded borders
                            ),
                          ),
                          validator: (value) {
                            // Validates email input
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16), // Spacer between fields

                      // Password input field with validation
                      Container(
                        width: 400, // Sets a fixed width for the input field
                        child: TextFormField(
                          controller:
                              _passwordController, // Binds the controller
                          obscureText: true, // Hides the password input
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock,
                                color: Colors.black), // Icon for password
                            labelText: 'Password', // Label for the input field
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded borders
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded borders
                            ),
                          ),
                          validator: (value) {
                            // Validates password input
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 10), // Spacer for alignment

                      // "Forgot Password" link
                      Align(
                        alignment:
                            Alignment.centerRight, // Aligns text to the right
                        child: TextButton(
                          onPressed: () {
                            // Action for "Forgot Password" (currently empty)
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                            ),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black), // Black text color
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30), // Spacer before login button

                      // Login button with action
                      ElevatedButton(
                        onPressed: _login, // Calls the login function
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12), // Button size
                          backgroundColor: Colors.black, // Button color
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30)), // Rounded shape
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold), // Button text
                        ),
                      ),

                      const SizedBox(
                          height: 20), // Spacer before "Create Account"

                      // "Create an Account" link
                      TextButton(
                        onPressed: () {
                          // Action for navigating to the SignUp screen (currently empty)
                        },
                        child: const Text(
                          'Create an Account',
                          style: TextStyle(
                              color: Colors.black), // Black text color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
