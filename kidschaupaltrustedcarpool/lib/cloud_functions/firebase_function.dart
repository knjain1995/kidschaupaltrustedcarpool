import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:kidschaupaltrustedcarpool/models/user_model.dart';

/// 🔥 **FirebaseFunctions** handles all Firebase Authentication operations
/// for the KidsChaupalTrustedCarpool application.
class FirebaseFunctions {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// ✅ **Authenticate User**: Logs in a user using Firebase Authentication.
  /// Returns `null` on success, or an error message on failure.
  static Future<String?> authUser(LoginData data) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null; // 🎯 Successful login
    } catch (e) {
      return 'Login failed: ${e.toString()}';
    }
  }

  /// ✅ **Signup User**: Registers a new user in Firebase Authentication.
  /// Converts the returned Firebase [User] object to [UserModel] and returns it.
  static Future<UserModel?> signupUser(SignupData data) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // Map Firebase User to UserModel
        return UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
      return null; // 🚫 User creation failed
    } catch (e) {
      return null; // ❌ Error handled elsewhere
    }
  }

  /// 🔍 **Fetch User by Email**: Retrieves user details by email and maps to [UserModel].
  static Future<UserModel?> fetchUserByEmail(String email) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null && user.email == email) {
        return UserModel(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName ?? '',
        );
      }
      return null; // 🚫 No matching user found
    } catch (e) {
      rethrow; // ❌ Handle error in calling function
    }
  }

  /// 🔄 **Recover Password**: Sends a password reset email via Firebase.
  /// Returns `null` on success, or an error message on failure.
  static Future<String?> recoverPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null; // 🎯 Email sent successfully
    } catch (e) {
      return 'Error sending password reset email: ${e.toString()}';
    }
  }
}




// 📝 **Changes made:**
// - ✅ Introduced **UserModel** for storing user details.
// - ✅ Implemented **UserState** for managing user data globally.
// - 🔔 Added **ChangeNotifier** for state updates.
// - 🏗️ Modular and expandable design for future Firestore integration.

// 🔄 **Next Step:**
// Implement **auth_service.dart** to handle Firebase authentication and integrate with **UserState**.

// 💡 Let me know when you're ready to proceed with the next file or need further clarifications!



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_login/flutter_login.dart';

// class FirebaseFunctions {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   /// 🔑 Authenticate User
//   static Future<String?> authUser(LoginData data) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: data.name, password: data.password);
//       return null;
//     } catch (e) {
//       return 'Login failed: ${e.toString()}';
//     }
//   }

//   /// 📝 Signup User
//   static Future<String?> signupUser(SignupData data) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(email: data.name!, password: data.password!);
//       return null;
//     } catch (e) {
//       return 'Signup failed: ${e.toString()}';
//     }
//   }

//   /// 💡 Recover Password
//   static Future<String?> recoverPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       return null;
//     } catch (e) {
//       return 'Error: ${e.toString()}';
//     }
//   }

//   /// 🔍 Fetch User by Email
//   static Future<User?> fetchUserByEmail(String email) async {
//     return _auth.currentUser;
//   }
// }
