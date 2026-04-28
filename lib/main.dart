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
        scaffoldBackgroundColor: Colors.grey.shade100,
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
  int selectedLanguage = 0; // 0 English, 1 Afrikaans

  String t(String en, String af) {
    return selectedLanguage == 0 ? en : af;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t("Pongola Rise", "Pongola Styg")),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              setState(() {
                selectedLanguage = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 0, child: Text("English")),
              const PopupMenuItem(value: 1, child: Text("Afrikaans")),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  t("Power to the People", "Mag aan die Mense"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(t("Home", "Tuis")),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text(t("Jobs", "Werk")),
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: Text(t("News", "Nuus")),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(t("Settings", "Instellings")),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBanner(),
            const SizedBox(height: 15),
            menuGrid(),
            const SizedBox(height: 15),
            newsSection(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget topBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.green.shade700,
      child: Column(
        children: [
          const Icon(Icons.public, size: 70, color: Colors.amber),
          const SizedBox(height: 10),
          Text(
            t("Welcome to Pongola Rise!",
                "Welkom by Pongola Rise!"),
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            t("Building a better community together.",
                "Bou saam 'n beter gemeenskap."),
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget menuGrid() {
    final items = [
      [Icons.report, t("Report Issue", "Rapporteer Probleem")],
      [Icons.work, t("Jobs", "Werk")],
      [Icons.school, t("Education", "Onderwys")],
      [Icons.people, t("Community", "Gemeenskap")],
      [Icons.local_hospital, t("Health", "Gesondheid")],
      [Icons.contact_phone, t("Contacts", "Kontakte")],
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(items[index][0] as IconData,
                      size: 40, color: Colors.green),
                  const SizedBox(height: 10),
                  Text(
                    items[index][1] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget newsSection() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                t("Latest Community News", "Jongste Gemeenskapsnuus"),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              newsTile(
                t("Road repairs starting Monday.",
                    "Padherstel begin Maandag."),
              ),
              newsTile(
                t("Youth jobs program opening soon.",
                    "Jeugwerkprogram open binnekort."),
              ),
              newsTile(
                t("Town hall meeting this Friday.",
                    "Stadsaal vergadering Vrydag."),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsTile(String text) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 10),
      title: Text(text),
    );
  }
}import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: Colors.grey.shade100,
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
  int selectedLanguage = 0; // 0 English, 1 Afrikaans

  String t(String en, String af) {
    return selectedLanguage == 0 ? en : af;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t("Pongola Rise", "Pongola Styg")),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              setState(() {
                selectedLanguage = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 0, child: Text("English")),
              const PopupMenuItem(value: 1, child: Text("Afrikaans")),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  t("Power to the People", "Mag aan die Mense"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(t("Home", "Tuis")),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text(t("Jobs", "Werk")),
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: Text(t("News", "Nuus")),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(t("Settings", "Instellings")),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBanner(),
            const SizedBox(height: 15),
            menuGrid(),
            const SizedBox(height: 15),
            newsSection(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget topBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.green.shade700,
      child: Column(
        children: [
          const Icon(Icons.public, size: 70, color: Colors.amber),
          const SizedBox(height: 10),
          Text(
            t("Welcome to Pongola Rise!",
                "Welkom by Pongola Rise!"),
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            t("Building a better community together.",
                "Bou saam 'n beter gemeenskap."),
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget menuGrid() {
    final items = [
      [Icons.report, t("Report Issue", "Rapporteer Probleem")],
      [Icons.work, t("Jobs", "Werk")],
      [Icons.school, t("Education", "Onderwys")],
      [Icons.people, t("Community", "Gemeenskap")],
      [Icons.local_hospital, t("Health", "Gesondheid")],
      [Icons.contact_phone, t("Contacts", "Kontakte")],
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(items[index][0] as IconData,
                      size: 40, color: Colors.green),
                  const SizedBox(height: 10),
                  Text(
                    items[index][1] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget newsSection() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                t("Latest Community News", "Jongste Gemeenskapsnuus"),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              newsTile(
                t("Road repairs starting Monday.",
                    "Padherstel begin Maandag."),
              ),
              newsTile(
                t("Youth jobs program opening soon.",
                    "Jeugwerkprogram open binnekort."),
              ),
              newsTile(
                t("Town hall meeting this Friday.",
                    "Stadsaal vergadering Vrydag."),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsTile(String text) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 10),
      title: Text(text),
    );
  }
}
