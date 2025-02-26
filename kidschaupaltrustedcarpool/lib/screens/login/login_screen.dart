import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../root/root_navigation_view.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 1000);

  Future<String?> _authUser(LoginData data) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } catch (e) {
      return 'Login failed: ${e.toString()}';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );
      return null;
    } catch (e) {
      return 'Signup failed: ${e.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "KidsChaupal",
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed(RootNavigationView.routeName);
      },
      onRecoverPassword: (String email) {
        return FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((_) => null).catchError((e) => e.toString());
      },
      userValidator: (value) => value!.isEmpty ? 'Username required' : null,
      passwordValidator: (value) => value!.isEmpty ? 'Password required' : null,
      messages: LoginMessages(userHint: 'Email'),
      additionalSignupFields: [
        UserFormField(keyName: "firstName", displayName: "First Name"),
        UserFormField(keyName: "lastName", displayName: "Last Name"),
      ],
    );
  }
}
