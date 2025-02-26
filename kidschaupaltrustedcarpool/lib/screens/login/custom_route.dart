// 📂 custom_route.dart
// ✅ Implements **FadePageRoute** for smooth page transitions, matching **CoRider** with detailed comments.

import 'package:flutter/material.dart';

/// 🌟 **FadePageRoute**: Custom route providing a fade transition between screens.
/// Matches **CoRider**'s navigation experience.
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

// 📝 **Changes made:**
// - 🏃‍♂️ Created **FadePageRoute** to align navigation transitions with **CoRider**.
// - 🔄 Provides smooth fade effects when navigating between screens.

// 🚀 **Next Steps:**
// 1️⃣ Implement `onboarding_screen.dart` to complete login navigation flow.
// 2️⃣ Ensure the onboarding experience mirrors **CoRider**, maintaining incremental progress.

// 💡 Let me know when you're ready to proceed or if you need clarifications on this part!











// // 📂 custom_route.dart
// // ✅ Implements custom page transitions matching **CoRider's** exact implementation.

// import 'package:flutter/material.dart';

// /// 🔄 **FadePageRoute**: Custom page transition with a fade animation.
// /// This route provides a smooth fade-in transition when navigating between screens.
// ///
// /// Usage:
// /// ```dart
// /// Navigator.of(context).push(FadePageRoute(builder: (context) => NextScreen()));
// /// ```
// class FadePageRoute<T> extends PageRouteBuilder<T> {
//   final WidgetBuilder builder;

//   FadePageRoute({
//     required this.builder,
//     RouteSettings? settings,
//   }) : super(
//           settings: settings,
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               builder(context),
//           transitionsBuilder: (
//             context,
//             animation,
//             secondaryAnimation,
//             child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//           transitionDuration: const Duration(milliseconds: 500), // ⚡ Adjust fade duration here
//         );
// }

// // 📜 **Key Details:**
// // - 📦 Custom fade effect for smoother navigation.
// // - 🎛️ Configurable `transitionDuration`.
// // - 🏃 Fully aligned with **CoRider's** navigation transition logic.

// // 💬 Let me know if you need explanations on how transitions impact user experience or adjustments to transition durations.
