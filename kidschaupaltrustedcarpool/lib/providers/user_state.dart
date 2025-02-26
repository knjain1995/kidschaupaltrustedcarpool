// 📂 user_state.dart
// ✅ **UserState** implementation matching **CoRider**, with detailed comments for complete understanding.

import 'package:flutter/material.dart';

import '../models/user_model.dart';

// /// 🌟 **User Model**: Represents the basic user details like first and last name.
// /// These details are fetched after login/signup and stored here for app-wide access.
// class UserModel {
//   final String firstName;
//   final String lastName;

//   UserModel({required this.firstName, required this.lastName});
// }

/// 🔄 **UserState**: Manages user-related data and state across the entire app.
/// Using `ChangeNotifier` allows widgets to listen for updates when user data changes.
class UserState extends ChangeNotifier {
  UserModel? _currentUser; // 🔒 Private variable to hold current user details.

  /// 🧩 **Getter** for `_currentUser`. Widgets access user data via this getter.
  UserModel? get currentUser => _currentUser;

  /// ✍️ **Sets the current user** after login/signup and notifies listening widgets.
  ///
  /// - `user`: A [UserModel] object containing user details.
  Future<void> setCurrentUser(UserModel user) async {
    _currentUser = user;
    notifyListeners(); // 🔔 Notifies all widgets listening to this state.
  }

  /// 🧹 **Clears user data** (e.g., on logout) and notifies listeners.
  Future<void> clearUser() async {
    _currentUser = null;
    notifyListeners();
  }

  /// 🌐 **Simulates loading user data** (expandable for Firestore integration later).
  /// Currently, a placeholder for future database operations.
  Future<void> loadData() async {
    // ⏳ Simulate data load (e.g., fetch additional user details from Firestore)
    await Future.delayed(const Duration(seconds: 1));
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
