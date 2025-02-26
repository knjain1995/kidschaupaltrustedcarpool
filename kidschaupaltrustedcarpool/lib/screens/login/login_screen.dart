// 📂 login_screen.dart
// ✅ Refactored with corrected imports and definitions to match **CoRider's** exact implementation.

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../../cloud_functions/firebase_function.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../providers/user_state.dart';
import '../../screens/login/custom_route.dart';
import '../root/root_navigation_root.dart';


// ✅ LoginScreen: Replicates CoRider's Login UI and functionality
class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final UserState userState;
  static bool isFirstTimeLoad = false;

  const LoginScreen({super.key, required this.userState});

  Duration get loginTime => const Duration(milliseconds: 1000); // ⏳ Login animation time

  // 🚀 Handles login after authentication
  Future<String?> _handleLogin(BuildContext context, String email) async {
    try {
      await FirebaseFunctions.fetchUserByEmail(email).then((user) async {
        await userState.setCurrentUser(user!);
        await userState.loadData();
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "TrustedCarpool",
      userType: LoginUserType.email,
      savedEmail: "testuser@example.com", // ⚡ TEMP: For quick testing
      savedPassword: "Test@123",

      // 🔒 Login logic via FirebaseFunctions
      onLogin: (data) async {
        final err = await FirebaseFunctions.authUser(data);
        if (err == null) {
          return await _handleLogin(context, data.name);
        } else {
          return err;
        }
      },

      // ✍️ Signup logic using FirebaseFunctions
      onSignup: (data) async {
        final err = await FirebaseFunctions.signupUser(data);
        if (err == null) {
          return await _handleLogin(context, data.name!);
        } else {
          return err;
        }
      },

      // 🚦 Redirects after login/signup based on first-time load
      onSubmitAnimationCompleted: () {
        if (isFirstTimeLoad) {
          isFirstTimeLoad = false;
          Navigator.of(context).pushAndRemoveUntil(
            FadePageRoute(
              builder: (context) => OnboardingScreen(userState: userState),
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            FadePageRoute(
              builder: (context) => RootNavigationView(userState: userState),
            ),
            (route) => false,
          );
        }
      },

      userValidator: (value) => null,
      passwordValidator: (value) => null,
      onRecoverPassword: FirebaseFunctions.recoverPassword,

      messages: LoginMessages(
        userHint: 'Company Email',
      ),

      additionalSignupFields: [
        UserFormField(
          keyName: "firstName",
          displayName: "First Name",
          fieldValidator: (value) => value!.isEmpty ? 'First Name is required' : null,
        ),
        UserFormField(
          keyName: "lastName",
          displayName: "Last Name",
          fieldValidator: (value) => value!.isEmpty ? 'Last Name is required' : null,
        ),
      ],

      loginAfterSignUp: true, // 🔄 Auto-login after successful signup
    );
  }
}

// 📜 **Key Updates:**
// 🔧 Corrected imports with relative paths reflecting updated structure.
// 🛠️ Ensured FadePageRoute, OnboardingScreen, and RootNavigationView are referenced accurately.
// 💬 Let me know if you need assistance implementing missing files or testing the flow.
