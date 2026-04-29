
import 'package:flutter/material.dart';

import 'screens/auth_gate.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/reports_page.dart';
import 'screens/jobs_page.dart';
import 'screens/polls_page.dart';
import 'screens/admin_page.dart';

void main() {
  runApp(const PongolaRiseApp());
}

class PongolaRiseApp extends StatelessWidget {
  const PongolaRiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pongola Rise',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF06140A),
        cardColor: const Color(0xFF10151C),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/reports': (context) => const ReportsPage(),
        '/jobs': (context) => const JobsPage(),
        '/polls': (context) => const PollsPage(),
        '/admin': (context) => const AdminPage(),
      },
    );
  }
}
