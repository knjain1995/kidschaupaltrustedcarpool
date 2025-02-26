import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserState extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  /// 🔄 Set Current User
  Future<void> setCurrentUser(User user) async {
    _currentUser = user;
    notifyListeners();
  }

  /// 🌐 Load User Data (if any additional data needs to be fetched)
  Future<void> loadData() async {
    if (_currentUser != null) {
      // Add logic to load extra user details here.
      notifyListeners();
    }
  }
}
