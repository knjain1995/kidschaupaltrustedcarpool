// Importing FirebaseAuth for authentication-related operations
import 'package:firebase_auth/firebase_auth.dart';

// AuthService class handles all Firebase Authentication functionalities
class AuthService {
  // Creating an instance of FirebaseAuth to access its methods
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to sign up users using email and password
  Future<User?> signUp(String email, String password) async {
    try {
      // 'createUserWithEmailAndPassword' creates a new user in Firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user; // Returns the User object on successful signup
    } catch (e) {
      // If an error occurs during signup, it will be printed here
      print('Error signing up: $e');
      return null; // Returns null if signup fails
    }
  }

  // Method to sign in users using email and password
  Future<User?> signIn(String email, String password) async {
    try {
      // 'signInWithEmailAndPassword' authenticates existing users
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user; // Returns the User object on successful sign-in
    } catch (e) {
      // Handles errors like incorrect credentials
      print('Error signing in: $e');
      return null; // Returns null if sign-in fails
    }
  }

  // Method to sign out the currently signed-in user
  Future<void> signOut() async {
    await _auth.signOut(); // Firebase method to sign out
  }
}
