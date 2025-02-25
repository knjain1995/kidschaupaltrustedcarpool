// Importing Flutter's material design library
import 'package:flutter/material.dart';
import '../../services/auth_service.dart'; // Importing AuthService for authentication methods

// LoginScreen is a StatefulWidget because user input fields need state management
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State class for LoginScreen
class _LoginScreenState extends State<LoginScreen> {
  // Controllers to capture user input from TextFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Creating an instance of AuthService to use signIn functionality
  final AuthService _authService = AuthService();

  // Function to handle the login process
  void _login() async {
    // Retrieving user input and removing whitespace
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Calling signIn from AuthService
    final user = await _authService.signIn(email, password);
    if (user != null) {
      // If login is successful, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // If login fails, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI of the login screen
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // App bar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the body
        child: Column(
          children: [
            // TextField for email input
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            // TextField for password input with obscured text
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20), // Adds spacing between elements
            // Button to trigger the login process
            ElevatedButton(
              onPressed: _login, // Calls _login when pressed
              child: const Text('Login'),
            ),
            // Navigation link to SignUpScreen if the user doesn't have an account
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
              child: const Text('Don\'t have an account? Sign up here.'),
            ),
          ],
        ),
      ),
    );
  }
}
