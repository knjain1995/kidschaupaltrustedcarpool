// Importing Flutter's material design library
import 'package:flutter/material.dart';
import 'package:kidschaupaltrustedcarpool/screens/auth/login_screen.dart';
import '../services/auth_service.dart'; // Importing AuthService for sign out functionality

// HomeScreen widget: Shown after successful login/signup
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Logout icon
            onPressed: () async {
              await AuthService().signOut(); // Sign out the user
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to KidsChaupal Trusted Carpool! 🚗',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
