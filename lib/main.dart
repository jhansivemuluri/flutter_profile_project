import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 237, 236),
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------- AppBar ----------------
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

      // ---------------- Column (overall layout) ----------------
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ---------------- Container (card) wrapping Stack ----------------
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // ---------------- Stack: profile image over banner ----------------
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Banner
                      Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            colors: [Colors.deepPurple, Colors.purpleAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      // Circle profile image, offset to overlap the banner
                      Positioned(
                        bottom: -45,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.deepPurple,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/300?img=12',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Space for the overlapping avatar
                  const SizedBox(height: 55),

                  // ---------------- Text: name & bio ----------------
                  const Text(
                    'JHANSI VEMULURI',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: const Text(
                      'GOOD COMMUNICATION SKILLS     QUICK LEARNER    BUILDING FLUTTER PROJECTS   ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(indent: 24, endIndent: 24),

                  // ---------------- Row: social stats ----------------
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _StatItem(label: 'CGPA', value: '9.27'),
                        _VerticalDivider(),
                        _StatItem(label: 'SKILLS', value: 'PYTHON,JAVA'),
                        _VerticalDivider(),
                        _StatItem(label: 'NPTEL', value: 'PROGRAMMING IN JAVA'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ---------------- Follow / Message buttons (Row) ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Follow'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        side: const BorderSide(color: Colors.deepPurple),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Message'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// A single stat item used inside the social-stats Row (value + label).
class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
/// Small vertical divider placed between stat items in the Row.
class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: const Color.fromARGB(255, 2, 58, 83),
    );
  }
}
