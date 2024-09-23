import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rutgers University",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "I'm an CS student at Rutgers, and I love to code.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Icon(Icons.work, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "Company Inc.",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.school, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "Rutgers",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.location_on, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "New Jersey",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildSocialButton(Icons.code, "GitHub", () {
                  Clipboard.setData(const ClipboardData(
                      text: "https://github.com/misraishan"));
                }),
                _buildSocialButton(Icons.work_history_outlined, "LinkedIn", () {
                  Clipboard.setData(const ClipboardData(
                      text: "https://www.linkedin.com/in/misraishan/"));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String title, String value) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      IconData icon, String labelText, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(labelText),
      onPressed: onPressed,
    );
  }
}
