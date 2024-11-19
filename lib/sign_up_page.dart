import 'package:flutter/material.dart';
import 'password_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _prnController = TextEditingController();
  final TextEditingController _parentNumberController = TextEditingController();
  final TextEditingController _ownNumberController = TextEditingController();
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _hostelNameController = TextEditingController();

  Future<void> _next() async {
    // Proceed to Password Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordPage(
          name: _nameController.text,
          prn: _prnController.text,
          parentNumber: _parentNumberController.text,
          ownNumber: _ownNumberController.text,
          roomNumber: _roomNumberController.text,
          hostelName: _hostelNameController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: _prnController, decoration: const InputDecoration(labelText: 'PRN Number')),
              TextField(controller: _parentNumberController, decoration: const InputDecoration(labelText: 'Parent\'s Mobile Number')),
              TextField(controller: _ownNumberController, decoration: const InputDecoration(labelText: 'Your Mobile Number')),
              TextField(controller: _roomNumberController, decoration: const InputDecoration(labelText: 'Room Number')),
              TextField(controller: _hostelNameController, decoration: const InputDecoration(labelText: 'Hostel Name')),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _next, child: const Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
