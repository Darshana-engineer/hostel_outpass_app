import 'package:flutter/material.dart';
import 'local_outpass_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/user_photo.png')), // Replace with Firebase image later
          const SizedBox(height: 10),
          const Text('Welcome, User!', style: TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocalOutpassPage()),
              );
            },
            child: const Text('Local Outpass'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to holiday outpass page
            },
            child: const Text('Holiday Outpass'),
          ),
        ],
      ),
    );
  }
}
