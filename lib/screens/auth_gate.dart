import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary until Firebase auth logic added next step
    const bool loggedIn = false;

    if (loggedIn) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
