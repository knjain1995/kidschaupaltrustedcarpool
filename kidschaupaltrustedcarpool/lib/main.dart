// Importing the necessary Flutter and Firebase packages
import 'package:flutter/material.dart'; // Flutter UI toolkit
import 'package:firebase_core/firebase_core.dart';
import 'package:kidschaupaltrustedcarpool/screens/login_screen.dart'; // For Firebase initialization

// The main function is the entry point of the Flutter application.
// 'async' allows the use of 'await' for asynchronous operations.
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all widgets are initialized before Firebase
  await Firebase.initializeApp(); // Initializes Firebase for the entire app
  runApp(const MyApp()); // Runs the MyApp widget, which is the root of the app
}

// The MyApp widget sets up the main configurations for the application, like theme and home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides material design elements.
    return MaterialApp(
      title: 'KidsChaupal Trusted Carpool', // Title of the app
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets the primary theme color
      ),
      home: const LoginScreen(), // The first screen shown when the app starts (Login Screen)
    );
  }
}
