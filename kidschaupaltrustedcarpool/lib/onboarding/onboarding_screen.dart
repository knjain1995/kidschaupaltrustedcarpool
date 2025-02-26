// // 📂 onboarding_screen.dart
// // ✅ Fully replicates **CoRider's** onboarding screen functionality with detailed comments.

// import 'package:flutter/material.dart';
// import '../../providers/user_state.dart';
// import '../../screens/login/custom_route.dart';
// import '../screens/root/root_navigation_view.dart';

// /// 🌟 **OnboardingScreen**: Guides users through the initial app introduction flow.
// /// Users see onboarding only on the first login.
// class OnboardingScreen extends StatelessWidget {
//   final UserState userState;

//   const OnboardingScreen({super.key, required this.userState});

//   /// 🚀 Navigates to the main application view after onboarding.
//   void _navigateToHome(BuildContext context) {
//     Navigator.of(context).pushAndRemoveUntil(
//       FadePageRoute(
//         builder: (context) => RootNavigationView(userState: userState),
//       ),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Welcome to KidsChaupalTrustedCarpool!",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Let's get you started with a quick tour of the app.",
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () => _navigateToHome(context),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 "Get Started",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 📜 **Key Features:**
// // - 🎨 Minimal onboarding screen design matching **CoRider** aesthetics.
// // - 🚦 Navigates seamlessly to the main view via `FadePageRoute`.
// // - 🏃 Fully integrated with `UserState` for user context management.

// // 💬 Let me know if further adjustments are needed or explanations on navigation behavior are required.
