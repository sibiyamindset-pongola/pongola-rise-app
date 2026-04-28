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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    DashboardPage(),
    CommunityPage(),
    NewsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pongola Rise"),
        centerTitle: true,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: "News",
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

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.how_to_vote),
            title: Text("Empower Pongola"),
            subtitle: Text("Independent leadership for the people."),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.trending_up),
            title: Text("Development"),
            subtitle: Text("Jobs, roads, water, growth."),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.groups),
            title: Text("Unity"),
            subtitle: Text("Working together as one community."),
          ),
        ),
      ],
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Community Discussions Coming Soon",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Latest Campaign News",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Candidate Profile",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
