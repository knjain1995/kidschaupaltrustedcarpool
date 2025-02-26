import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login/flutter_login.dart';

class FirebaseFunctions {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🔑 Authenticate User
  static Future<String?> authUser(LoginData data) async {
    try {
      await _auth.signInWithEmailAndPassword(email: data.name, password: data.password);
      return null;
    } catch (e) {
      return 'Login failed: ${e.toString()}';
    }
  }

  /// 📝 Signup User
  static Future<String?> signupUser(SignupData data) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: data.name!, password: data.password!);
      return null;
    } catch (e) {
      return 'Signup failed: ${e.toString()}';
    }
  }

  /// 💡 Recover Password
  static Future<String?> recoverPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  /// 🔍 Fetch User by Email
  static Future<User?> fetchUserByEmail(String email) async {
    return _auth.currentUser;
  }
}
