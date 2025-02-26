// 📂 root_navigation_view.dart
// ✅ Updated `RootNavigationView` to pass `userState` to **HomeScreen**, resolving required argument errors.

import 'package:flutter/material.dart';
import 'package:kidschaupaltrustedcarpool/providers/user_state.dart';
import 'package:kidschaupaltrustedcarpool/screens/home/home_screen.dart';

class RootNavigationView extends StatefulWidget {
  final UserState userState;

  const RootNavigationView({Key? key, required this.userState}) : super(key: key);

  @override
  State<RootNavigationView> createState() => _RootNavigationViewState();
}

class _RootNavigationViewState extends State<RootNavigationView> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(userState: widget.userState), // ✅ Now passes `userState` as required
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // 🚧 Future modules (Profile, Rides, Settings) to be added incrementally
        ],
      ),
    );
  }
}

// 📝 **root_navigation_view.dart Updates:**
// - 🔄 Fixed `HomeScreen` instantiation by passing `userState` as required.
// - 🏃‍♂️ Matches **CoRider**'s navigation architecture with accurate parameter handling.

// 🚀 **Next Steps:**
// 1️⃣ Review **onboarding_screen.dart** to finalize login flow.
// 2️⃣ Incrementally add further screens, ensuring `userState` is consistently passed.

// 💡 Let me know if any routing or provider access issues persist before we move forward!


// // 📂 root_navigation_view.dart
// // ✅ Handles bottom navigation, aligning with **CoRider**'s navigation architecture.

// import 'package:flutter/material.dart';
// import 'package:kidschaupaltrustedcarpool/providers/user_state.dart';
// import 'package:kidschaupaltrustedcarpool/screens/home/home_screen.dart';

// class RootNavigationView extends StatefulWidget {
//   final UserState userState;

//   const RootNavigationView({Key? key, required this.userState}) : super(key: key);

//   @override
//   State<RootNavigationView> createState() => _RootNavigationViewState();
// }

// class _RootNavigationViewState extends State<RootNavigationView> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//     const HomeScreen(), // ✅ Placeholder for home screen; will evolve incrementally
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           // 🚧 Future modules (Profile, Rides, Settings) to be added incrementally
//         ],
//       ),
//     );
//   }
// }

// // 📝 **root_navigation_view.dart Updates:**
// // - 🔄 Added `RootNavigationView` with bottom navigation logic matching **CoRider**.
// // - 🏃‍♂️ Currently supports **HomeScreen**; more tabs will be added as modules progress.

// // 🚀 **Next Steps:**
// // 1️⃣ Finalize **onboarding_screen.dart** to complete login flow.
// // 2️⃣ Add further screens incrementally to bottom navigation based on **CoRider**'s structure.

// // 💡 Confirm if any issues arise in routing or provider access before proceeding further!



// import 'package:flutter/material.dart';
// import 'package:kidschaupaltrustedcarpool/screens/home/home_screen.dart';

// /// RootNavigationView manages the main navigation of the app.
// /// Currently, it includes only the HomeScreen.
// class RootNavigationView extends StatefulWidget {
//   static const routeName = '/rootNavigation';

//   const RootNavigationView({super.key});

//   @override
//   State<RootNavigationView> createState() => _RootNavigationViewState();
// }

// class _RootNavigationViewState extends State<RootNavigationView> {
//   int _selectedIndex = 0;

//   static final List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
