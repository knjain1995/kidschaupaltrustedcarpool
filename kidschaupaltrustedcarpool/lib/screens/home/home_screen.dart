// 📂 home_screen.dart
// ✅ **Home Screen** implementation matching **CoRider**, fully modular with detailed comments.

import 'package:flutter/material.dart';
import '../../providers/user_state.dart';

/// 🌟 **HomeScreen**: The main landing screen after login/onboarding.
/// Shows a welcome message and buttons to navigate to ride offering/requesting.
class HomeScreen extends StatelessWidget {
  final UserState userState;

  const HomeScreen({super.key, required this.userState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KidsChaupal Trusted Carpool"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, ${userState.currentUser?.firstName ?? "User"}!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 🚗 Placeholder navigation for offering a ride
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Offer a Ride coming soon!")),
                );
              },
              child: const Text("Offer a Ride"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 🎯 Placeholder navigation for requesting a ride
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Request a Ride coming soon!")),
                );
              },
              child: const Text("Request a Ride"),
            ),
          ],
        ),
      ),
    );
  }
}

// 📝 **Changes made:**
// - ✅ Introduced **HomeScreen** widget with welcome message and basic buttons.
// - 🚫 Navigation buttons currently show SnackBars as placeholders.
// - 🏗️ Modular design: Future ride modules will replace SnackBars with actual navigation.

// 🔄 **Next Step:**
// Update **RootNavigationView** to reference **HomeScreen** instead of placeholder text.

// 💡 Let me know when you want to implement the next screen or expand this one further!
