import 'package:flutter/material.dart';

void main() {
  runApp(const PongolaRiseV120());
}

class PongolaRiseV120 extends StatelessWidget {
  const PongolaRiseV120({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pongola Rise V12.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF03070B),
        fontFamily: 'Arial',
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final List<Widget> pages = const [
    DashboardPage(),
    ReportsPage(),
    JobsPage(),
    PollsPage(),
    LeaderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        icon: const Icon(Icons.campaign),
        label: const Text("Join Now"),
        onPressed: () {},
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (v) {
          setState(() => index = v);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.report_outlined),
            selectedIcon: Icon(Icons.report),
            label: "Reports",
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: "Jobs",
          ),
          NavigationDestination(
            icon: Icon(Icons.poll_outlined),
            selectedIcon: Icon(Icons.poll),
            label: "Polls",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Leader",
          ),
        ],
      ),
    );
  }
}

class PageWrap extends StatelessWidget {
  final String title;
  final Widget child;

  const PageWrap({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: child,
    );
  }
}

class NeoCard extends StatelessWidget {
  final Widget child;

  const NeoCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0F1720),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget stat(String number, String label, IconData icon) {
    return Expanded(
      child: NeoCard(
        child: Column(
          children: [
            Icon(icon, color: Colors.amber, size: 30),
            const SizedBox(height: 8),
            Text(
              number,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(String title, IconData icon) {
    return NeoCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.greenAccent),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.white54,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      title: "Pongola Rise",
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade900,
                  Colors.green.shade700,
                  Colors.green.shade500,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.35),
                  blurRadius: 30,
                ),
              ],
            ),
            child: const Column(
              children: [
                Icon(Icons.flag, size: 76, color: Colors.amber),
                SizedBox(height: 12),
                Text(
                  "Together We Rise",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Unity • Jobs • Real Change",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              stat("680", "Reports", Icons.report),
              const SizedBox(width: 10),
              stat("311", "Jobs", Icons.work),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              stat("3.4K", "Supporters", Icons.group),
              const SizedBox(width: 10),
              stat("126", "Events", Icons.event),
            ],
          ),

          const SizedBox(height: 18),

          menu("Emergency Water Reports", Icons.water_drop),
          menu("Road Repair Requests", Icons.traffic),
          menu("Youth Opportunities", Icons.school),
          menu("Volunteer Registration", Icons.how_to_reg),
          menu("Community News", Icons.newspaper),
          menu("Safety Alerts", Icons.security),
          menu("Ward Meetings", Icons.groups),
          menu("Business Support", Icons.store),
          menu("Live Dashboard", Icons.bar_chart),
        ],
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  Widget item(String title, IconData icon) {
    return NeoCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.redAccent),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: const Text(
          "Tap to submit issue",
          style: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      title: "Reports Centre",
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          item("Water Outage", Icons.water_drop),
          item("Electricity Fault", Icons.flash_on),
          item("Road Damage", Icons.traffic),
          item("Waste Collection", Icons.delete),
          item("Crime Concern", Icons.security),
          item("Corruption Report", Icons.warning),
          item("Clinic Complaint", Icons.local_hospital),
          item("School Issue", Icons.school),
          item("Street Light Fault", Icons.lightbulb),
          item("Broken Sewer Line", Icons.plumbing),
          item("Storm Damage", Icons.cloud),
          item("Bridge Damage", Icons.construction),
        ],
      ),
    );
  }
}

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  Widget job(String title, String type) {
    return NeoCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.work, color: Colors.greenAccent),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          type,
          style: const TextStyle(color: Colors.white60),
        ),
        trailing: const Icon(Icons.open_in_new, color: Colors.white54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      title: "Jobs & Growth",
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          job("Municipal Internship Program", "Youth"),
          job("EPWP Worker Intake", "Temporary"),
          job("Business Startup Grants", "Entrepreneurs"),
          job("Bursary Applications", "Students"),
          job("Skills Training Bootcamp", "Community"),
          job("Security Vacancies", "Private Sector"),
          job("Retail Vacancies", "Private Sector"),
          job("Driver Positions", "Transport"),
          job("Admin Clerk Posts", "Office"),
          job("Farm Opportunities", "Agriculture"),
          job("Tourism Vacancies", "Hospitality"),
          job("Construction Jobs", "Projects"),
        ],
      ),
    );
  }
}

class PollsPage extends StatefulWidget {
  const PollsPage({super.key});

  @override
  State<PollsPage> createState() => _PollsPageState();
}

class _PollsPageState extends State<PollsPage> {
  int selected = -1;

  final options = [
    "Jobs Creation",
    "Road Repairs",
    "Water Reliability",
    "Youth Development",
    "Safety & Crime",
    "Clean Governance",
    "Business Growth",
    "Healthcare",
    "Housing",
    "Education",
    "Tourism",
  ];

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      title: "Community Polls",
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: NeoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What is Pongola's top priority?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ...List.generate(
                options.length,
                (i) => RadioListTile<int>(
                  value: i,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    options[i],
                    style: const TextStyle(color: Colors.white),
                  ),
                  onChanged: (v) {
                    setState(() => selected = v!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaderPage extends StatelessWidget {
  const LeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      title: "Leadership",
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: NeoCard(
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 54,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    size: 58,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "Independent Candidate",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Committed to honest leadership, jobs, youth empowerment, housing, education, business growth, and safe communities.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 14),
                Chip(
                  label: Text("Power to the People"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
