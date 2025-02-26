// 📄 **Updated UserModel** (Dynamic displayName generation)

class UserModel {
  /// 🆔 **User ID**: Unique identifier for the user from Firebase Authentication.
  final String uid;

  /// 📧 **Email**: The user's email address.
  final String email;

  /// 🏷️ **First Name**: The user's first name.
  final String firstName;

  /// 🏷️ **Last Name**: The user's last name.
  final String lastName;

  /// 🏗️ **Constructor**: Initializes the [UserModel] with required fields.
  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  /// 🏷️ **Dynamic Display Name**: Combines first and last names.
  String get displayName => '$firstName $lastName';

  /// 🔄 **Factory Constructor**: Creates a [UserModel] from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }

  /// 📝 **Convert to JSON**: Converts [UserModel] instance to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  /// 🏷️ **Readable Representation**: Provides a readable string for debugging.
  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, firstName: $firstName, lastName: $lastName)';
  }
}

// /// 📄 **UserModel**: Represents user details for the KidsChaupalTrustedCarpool application.
// /// This model is used throughout the app to pass user data in a structured manner.

// class UserModel {
//   /// 🆔 **User ID**: Unique identifier for the user from Firebase Authentication.
//   final String uid;

//   /// 📧 **Email**: The user's email address.
//   final String email;

//   /// 🏷️ **Display Name**: The display name of the user (optional in Firebase).
//   final String displayName;

//   /// 🏗️ **Constructor**: Initializes the [UserModel] with required fields.
//   UserModel({
//     required this.uid,
//     required this.email,
//     required this.displayName,
//   });

//   /// 🔄 **Factory Constructor**: Creates a [UserModel] from a JSON map.
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       uid: json['uid'] ?? '',
//       email: json['email'] ?? '',
//       displayName: json['displayName'] ?? '',
//     );
//   }

//   /// 📝 **Convert to JSON**: Converts [UserModel] instance to JSON map.
//   Map<String, dynamic> toJson() {
//     return {
//       'uid': uid,
//       'email': email,
//       'displayName': displayName,
//     };
//   }

//   /// 🏷️ **Readable Representation**: Provides a readable string for debugging.
//   @override
//   String toString() {
//     return 'UserModel(uid: $uid, email: $email, displayName: $displayName)';
//   }
// }
