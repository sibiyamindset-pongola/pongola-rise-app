/// =============================================================
/// PONGOLA RISE V25
/// SMART ADMIN + NOTIFICATIONS
///
/// NEW:
/// ✅ Smart Admin Dashboard
/// ✅ Report Counters
/// ✅ Job Counters
/// ✅ Send Notifications
/// ✅ Announcement Center
/// ✅ Approve / Resolve Reports
/// ✅ Better Navigation
///
/// FIREBASE PACKAGES:
/// flutter pub add firebase_core
/// flutter pub add firebase_auth
/// flutter pub add cloud_firestore
/// flutter pub add firebase_messaging
/// =============================================================

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PongolaRiseV25());
}

class PongolaRiseV25 extends StatelessWidget {
  const PongolaRiseV25({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pongola Rise",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF071009),
      ),
      home: const MainShell(),
    );
  }
}

/* ============================================================
   MAIN APP
============================================================ */

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int page = 0;

  final pages = const [
    HomePage(),
    ReportsPage(),
    JobsPage(),
    SmartAdminPage(),
  ];

  final titles = const [
    "Home",
    "Reports",
    "Jobs",
    "Admin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[page]),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white54,
        onTap: (i) => setState(() => page = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: "Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: "Admin"),
        ],
      ),
    );
  }
}

/* ============================================================
   HOME
============================================================ */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        card(Icons.flag,
            "Welcome to Pongola Rise"),
        card(Icons.people,
            "Serving Community"),
        card(Icons.notifications,
            "Updates Live"),
      ],
    );
  }
}

/* ============================================================
   REPORTS PAGE
============================================================ */

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  Future<void> setStatus(
      String id, String status) async {
    await FirebaseFirestore.instance
        .collection("reports")
        .doc(id)
        .update({"status": status});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("reports")
          .snapshots(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return loader();
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: snap.data!.docs.map((doc) {
            final data =
                doc.data() as Map<String,
                    dynamic>;

            return Card(
              child: ListTile(
                title:
                    Text(data["issue"]),
                subtitle:
                    Text(data["status"]),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: "Pending",
                      child:
                          Text("Pending"),
                    ),
                    const PopupMenuItem(
                      value:
                          "Approved",
                      child:
                          Text("Approved"),
                    ),
                    const PopupMenuItem(
                      value:
                          "Resolved",
                      child:
                          Text("Resolved"),
                    ),
                  ],
                  onSelected: (value) =>
                      setStatus(
                    doc.id,
                    value.toString(),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

/* ============================================================
   JOBS PAGE
============================================================ */

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("jobs")
          .snapshots(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return loader();
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: snap.data!.docs.map((doc) {
            final data =
                doc.data() as Map<String,
                    dynamic>;

            return Card(
              child: ListTile(
                leading:
                    const Icon(Icons.work),
                title:
                    Text(data["title"]),
                subtitle: Text(
                    data["company"]),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

/* ============================================================
   SMART ADMIN PAGE
============================================================ */

class SmartAdminPage extends StatefulWidget {
  const SmartAdminPage({super.key});

  @override
  State<SmartAdminPage> createState() =>
      _SmartAdminPageState();
}

class _SmartAdminPageState
    extends State<SmartAdminPage> {
  final note =
      TextEditingController();

  Future<void> sendNotice() async {
    await FirebaseFirestore.instance
        .collection(
            "announcements")
        .add({
      "message": note.text,
      "time": DateTime.now(),
    });

    note.clear();
  }

  Future<int> countDocs(
      String collection) async {
    final snap =
        await FirebaseFirestore
            .instance
            .collection(collection)
            .get();

    return snap.docs.length;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: Future.wait([
        countDocs("reports"),
        countDocs("jobs"),
        countDocs("users"),
      ]),
      builder: (context, snap) {
        if (!snap.hasData) {
          return loader();
        }

        final reports =
            snap.data![0];
        final jobs = snap.data![1];
        final users =
            snap.data![2];

        return ListView(
          padding:
              const EdgeInsets.all(16),
          children: [
            const Text(
              "Smart Admin Dashboard",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            gap(),

            statCard(
                "Reports",
                reports.toString(),
                Icons.report),

            statCard(
                "Jobs",
                jobs.toString(),
                Icons.work),

            statCard(
                "Users",
                users.toString(),
                Icons.people),

            gap(),
            const Divider(),

            const Text(
              "Send Notification",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            gap(),

            field(note,
                "Write message"),

            gap(),

            button(
              "Send Announcement",
              sendNotice,
            ),
          ],
        );
      },
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon,
            color: Colors.green),
        title: Text(title),
        trailing: Text(
          value,
          style:
              const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   REUSABLE
============================================================ */

Widget card(
    IconData icon,
    String text) {
  return Card(
    child: ListTile(
      leading: Icon(icon,
          color: Colors.green),
      title: Text(text),
    ),
  );
}

Widget field(
    TextEditingController c,
    String hint) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
                14),
      ),
    ),
  );
}

Widget button(
  String text,
  VoidCallback fn,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor:
          Colors.green,
      minimumSize:
          const Size(
              double.infinity,
              50),
    ),
    onPressed: fn,
    child: Text(text),
  );
}

Widget loader() {
  return const Center(
    child:
        CircularProgressIndicator(),
  );
}

Widget gap() =>
    const SizedBox(height: 12);
