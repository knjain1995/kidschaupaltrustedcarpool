import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';  // ✅ Import Firebase Core
import 'providers/user_state.dart';
import 'screens/login/login_screen.dart';
import 'firebase_options.dart';  // ✅ Generated file after Firebase CLI setup

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensures binding for async calls
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // ✅ Firebase config
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserState()), // ✅ Provide UserState globally
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidsChaupal Trusted Carpool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userState: Provider.of<UserState>(context, listen: false)),
    );
  }
}
