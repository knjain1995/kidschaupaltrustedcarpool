// Importing Flutter's material design library
import 'package:flutter/material.dart';
import 'package:kidschaupaltrustedcarpool/screens/home_screen.dart';
import '../../../services/auth_service.dart'; // Importing AuthService for authentication methods

// SignUpScreen is a StatefulWidget because it needs to manage form states and user inputs
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// State class for SignUpScreen
class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers to capture user input from TextFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService(); // Instance of AuthService

  final _formKey = GlobalKey<FormState>(); // Key for form validation

  // Function to handle user sign-up process
  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        final user = await _authService.signUp(email, password);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-up failed: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI for the sign-up screen
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')), // App bar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assigning the form key for validation
          child: Column(
            children: [
              // TextField for email input
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  // Validator to check if the email field is empty
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              // TextField for password input
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true, // Hides the password text
                validator: (value) {
                  // Validator to check if the password field is empty
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              // TextField for confirming password input
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  // Validator to ensure passwords match
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Button to trigger the sign-up process
              ElevatedButton(
                onPressed: _signUp, // Calls _signUp when pressed
                child: const Text('Sign Up'),
              ),
              // Link to navigate back to the LoginScreen
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigates back to LoginScreen
                },
                child: const Text('Already have an account? Login here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
