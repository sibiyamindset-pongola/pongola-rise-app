// =============================================================
// PONGOLA RISE V26 HYBRID
// Clean Build + Realistic Counters + Ready For Backend
// Replace FULL lib/main.dart with this code
// =============================================================

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
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF06110A),
        cardColor: const Color(0xFF0B1710),
      ),
      home: const MainShell(),
    );
  }
}

// =============================================================
// MAIN SHELL
// =============================================================

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final List<Widget> pages = const [
    HomePage(),
    ReportsPage(),
    JobsPage(),
    PollsPage(),
    AdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white60,
        onTap: (v) => setState(() => index = v),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.report), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.poll), label: "Polls"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: "Admin"),
        ],
      ),
    );
  }
}

// =============================================================
// HOME PAGE
// =============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pongola Rise"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Colors.green, Colors.lightGreen],
              ),
            ),
            child: const Column(
              children: [
                Icon(Icons.flag,
                    size: 60, color: Colors.amber),
                SizedBox(height: 12),
                Text(
                  "Together We Rise",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Truth • Service • Progress",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),

          // REALISTIC COUNTERS
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: const [
              StatCard(
                  icon: Icons.report,
                  title: "Reports",
                  value: "5"),
              StatCard(
                  icon: Icons.work,
                  title: "Jobs",
                  value: "2"),
              StatCard(
                  icon: Icons.people,
                  title: "Members",
                  value: "18"),
              StatCard(
                  icon: Icons.event,
                  title: "Meetings",
                  value: "3"),
            ],
          ),

          const SizedBox(height: 16),

          const SectionTitle("Latest Activity"),

          infoTile(Icons.water_drop,
              "Water issue reported in Ward 4"),
          infoTile(Icons.work,
              "2 new jobs posted today"),
          infoTile(Icons.campaign,
              "Community meeting Saturday"),
        ],
      ),
    );
  }
}

// =============================================================
// REPORTS
// =============================================================

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      "Street light not working",
      "Water leak near school",
      "Road pothole main road",
      "Illegal dumping area",
      "Clinic queue complaint",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Reports"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (_, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.warning,
                color: Colors.orange),
            title: Text(reports[i]),
            subtitle: const Text("Pending review"),
          ),
        ),
      ),
    );
  }
}

// =============================================================
// JOBS
// =============================================================

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = [
      "General Worker - Municipality",
      "Cashier - Local Shop",
      "Security Guard - Private Firm",
      "Cleaner - School",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs Board"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (_, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.work,
                color: Colors.greenAccent),
            title: Text(jobs[i]),
            trailing:
                const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

// =============================================================
// POLLS
// =============================================================

class PollsPage extends StatefulWidget {
  const PollsPage({super.key});

  @override
  State<PollsPage> createState() =>
      _PollsPageState();
}

class _PollsPageState extends State<PollsPage> {
  int selected = -1;

  final options = [
    "Jobs Creation",
    "Water Supply",
    "Road Repairs",
    "Youth Programs"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Poll"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "What should be priority?",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            options.length,
            (i) => RadioListTile(
              value: i,
              groupValue: selected,
              title: Text(options[i]),
              onChanged: (v) {
                setState(() {
                  selected = i;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Submit Vote"),
          )
        ],
      ),
    );
  }
}

// =============================================================
// ADMIN
// =============================================================

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() =>
      _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final controller = TextEditingController();

  final List<String> notices = [];

  void postNotice() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      notices.insert(0, controller.text.trim());
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Admin"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle("Post Notice"),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Write update...",
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: postNotice,
            child: const Text("Publish"),
          ),
          const SizedBox(height: 18),
          const SectionTitle("Announcements"),
          ...notices.map(
            (e) => Card(
              child: ListTile(
                leading: const Icon(
                    Icons.notifications,
                    color: Colors.amber),
                title: Text(e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// REUSABLE
// =============================================================

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B1710),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 34, color: Colors.amber),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget infoTile(IconData icon, String title) {
   Card(
    child: ListTile(
      leading:
          Icon(icon, color: Colors.greenAccent),
      title: Text(title),
    ),
  );
}
