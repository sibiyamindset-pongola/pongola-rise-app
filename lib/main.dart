import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pongola Rise'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text(
            'Welcome to Pongola Rise!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
