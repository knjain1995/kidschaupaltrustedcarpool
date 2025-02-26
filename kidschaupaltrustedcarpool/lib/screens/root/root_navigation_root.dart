import 'package:firebase_auth/firebase_auth.dart'; // ✅ Import FirebaseAuth
import 'package:flutter/material.dart';
import '../../providers/user_state.dart';
import '../login/login_screen.dart';

class RootNavigationView extends StatefulWidget {
  final UserState userState;

  const RootNavigationView({super.key, required this.userState});

  @override
  State<RootNavigationView> createState() => _RootNavigationViewState();
}

class _RootNavigationViewState extends State<RootNavigationView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("My Rides")),
    const Center(child: Text("Profile")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// 🚪 **Logout Functionality:** Handles Firebase sign out and navigates to login screen
  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); // ✅ Sign out from Firebase
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => LoginScreen(userState: widget.userState),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KidsChaupal Trusted Carpool"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context), // 🚪 Temporary logout button
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "My Rides",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
