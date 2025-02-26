// 📂 custom_route.dart
// ✅ Implements custom page transitions matching **CoRider's** exact implementation.

import 'package:flutter/material.dart';

/// 🔄 **FadePageRoute**: Custom page transition with a fade animation.
/// This route provides a smooth fade-in transition when navigating between screens.
///
/// Usage:
/// ```dart
/// Navigator.of(context).push(FadePageRoute(builder: (context) => NextScreen()));
/// ```
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 500), // ⚡ Adjust fade duration here
        );
}

// 📜 **Key Details:**
// - 📦 Custom fade effect for smoother navigation.
// - 🎛️ Configurable `transitionDuration`.
// - 🏃 Fully aligned with **CoRider's** navigation transition logic.

// 💬 Let me know if you need explanations on how transitions impact user experience or adjustments to transition durations.
