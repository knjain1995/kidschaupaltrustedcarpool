// 📂 main.dart
// ✅ Updated `main.dart` to ensure proper `UserState` passing to `RootNavigationView`, fixing missing parameter issues.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:kidschaupaltrustedcarpool/providers/user_state.dart';
import 'package:kidschaupaltrustedcarpool/screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ✅ Initializes Firebase at app startup

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserState()), // ✅ Provides UserState globally
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context, listen: false); // ✅ Access `UserState` here

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KidsChaupal Trusted Carpool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userState: userState), // ✅ Passes `userState` to LoginScreen
    );
  }
}

// 📝 **main.dart Updates:**
// - 🔥 Fixed missing `userState` parameter by passing it correctly from `MyApp`.
// - 🏃‍♂️ `UserState` still provided at app root using `MultiProvider`.
// - 📲 **LoginScreen** now receives `userState`, aligning with **CoRider** structure.


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';  // ✅ Import Firebase Core
// import 'providers/user_state.dart';
// import 'screens/login/login_screen.dart';
// import 'firebase_options.dart';
// import 'screens/root/root_navigation_view.dart';  // ✅ Generated file after Firebase CLI setup

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensures binding for async calls
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform, // ✅ Firebase config
//   );
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserState()), // ✅ Provide UserState globally
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'KidsChaupal Trusted Carpool',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const RootNavigationView(), // Starts from RootNavigationView
//       routes: {
//         RootNavigationView.routeName: (ctx) => const RootNavigationView(),
//         LoginScreen.routeName: (ctx) => const LoginScreen(),
//       },
//     );
//   }
// }
