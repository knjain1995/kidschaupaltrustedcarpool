// // This service handles all authentication logic using FirebaseAuth

// import 'package:firebase_auth/firebase_auth.dart';

// // ✅ AuthService: A class to manage user authentication processes (Signup, Login, Logout)
// class AuthService {
//   // 🌟 FirebaseAuth instance for authentication operations
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // ✅ Signup function
//   // Takes user's email and password, attempts to create a Firebase account
//   Future<String?> signUp(String email, String password) async {
//     try {
//       // 🛠 Create user with email and password
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return null; // ✅ Return null if signup is successful (no errors)
//     } on FirebaseAuthException catch (e) {
//       // ⚠️ Handle Firebase-specific signup errors
//       return e.message;
//     } catch (e) {
//       // ⚡ Handle any unexpected errors
//       return 'An unexpected error occurred during signup';
//     }
//   }

//   // ✅ Login function
//   // Takes user's email and password, attempts to sign them in
//   Future<String?> signIn(String email, String password) async {
//     try {
//       // 🛠 Sign in with FirebaseAuth
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return null; // ✅ Return null if login is successful
//     } on FirebaseAuthException catch (e) {
//       // ⚠️ Handle Firebase-specific login errors
//       return e.message;
//     } catch (e) {
//       // ⚡ Handle unexpected errors
//       return 'An unexpected error occurred during login';
//     }
//   }

//   // 🚪 Logout function
//   // Signs the current user out of the app
//   Future<void> signOut() async {
//     await _auth.signOut(); // 🔒 Logs out the user
//   }

//   // ✅ Stream to track authentication state (signed in/out)
//   // Useful for showing different screens based on login status
//   Stream<User?> get authStateChanges => _auth.authStateChanges();
// }

// // 📜 **Explanation:**
// // 1️⃣ signUp(): Creates a new Firebase user with email/password.
// // 2️⃣ signIn(): Logs in an existing user with email/password.
// // 3️⃣ signOut(): Logs out the user.
// // 4️⃣ authStateChanges: Listens for authentication state changes (logged in/out) in real-time.

// // 📝 **Usage:**
// // - Use AuthService().signUp() in SignupScreen for user registration.
// // - Use AuthService().signIn() in LoginScreen for user login.
// // - Use AuthService().signOut() for logging out users.
// // - Listen to AuthService().authStateChanges for authentication status changes.

// // 🌟 All functions include error handling with descriptive messages that can be shown via Snackbars or Toasts.
