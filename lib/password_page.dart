import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class PasswordPage extends StatefulWidget {
  final String name;
  final String prn;
  final String parentNumber;
  final String ownNumber;
  final String roomNumber;
  final String hostelName;

  const PasswordPage({
    super.key,
    required this.name,
    required this.prn,
    required this.parentNumber,
    required this.ownNumber,
    required this.roomNumber,
    required this.hostelName,
  });

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _saveAndLogin() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: "${widget.prn.trim()}@example.com",
        password: _passwordController.text.trim(),
      );

      // Save other details to Firestore (you can implement this)
      // e.g., FirebaseFirestore.instance.collection('users').doc(widget.prn).set({...})

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Create Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveAndLogin, child: const Text('Save and Login')),
          ],
        ),
      ),
    );
  }
}
