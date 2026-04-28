import 'package:flutter/material.dart';

void main() {
  runApp(const PongolaRiseApp());
}

class PongolaRiseApp extends StatelessWidget {
  const PongolaRiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pongola Rise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildCard(
      BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(title: title),
          ),
        );
      },
      child: Card(
        color: color,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.amber, size: 42),
              const SizedBox(height: 14),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.public, color: Colors.amber, size: 52),
                  SizedBox(height: 10),
                  Text(
                    "Pongola Rise",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Together We Rise",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.amber),
              title: Text(
                "English",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.amber),
              title: Text(
                "Afrikaans",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.amber),
              title: Text(
                "isiZulu",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text("Pongola Rise"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            color: Colors.amber,
            child: const Column(
              children: [
                Text(
                  "TOGETHER WE RISE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Community • Leadership • Opportunity",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                buildCard(
                  context,
                  "Report Issues",
                  Icons.report_problem,
                  Colors.green.shade800,
                ),
                buildCard(
                  context,
                  "Jobs",
                  Icons.work,
                  Colors.teal,
                ),
                buildCard(
                  context,
                  "Safety Alerts",
                  Icons.security,
                  Colors.red.shade700,
                ),
                buildCard(
                  context,
                  "Events",
                  Icons.event,
                  Colors.blueGrey,
                ),
                buildCard(
                  context,
                  "Join Movement",
                  Icons.group,
                  Colors.green.shade600,
                ),
                buildCard(
                  context,
                  "Donate",
                  Icons.volunteer_activism,
                  Colors.orange.shade700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  String getMessage() {
    switch (title) {
      case "Report Issues":
        return "Report water, roads, electricity and service delivery problems.";
      case "Jobs":
        return "Find jobs, internships and youth opportunities.";
      case "Safety Alerts":
        return "Receive important local safety notices.";
      case "Events":
        return "See community meetings and movement events.";
      case "Join Movement":
        return "Become part of Pongola Rise and help build the future.";
      case "Donate":
        return "Support community projects and movement growth.";
      default:
        return "Welcome to Pongola Rise.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green.shade800,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 70,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              getMessage(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
