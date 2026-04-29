import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Reports"),
      ),
      body: const Center(
        child: Text(
          "Reports page coming soon",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
