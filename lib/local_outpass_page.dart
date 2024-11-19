import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostel_outpass_app/successpage.dart';

class LocalOutpassPage extends StatefulWidget {
  const LocalOutpassPage({super.key});

  @override
  State<LocalOutpassPage> createState() => _LocalOutpassPageState();
}

class _LocalOutpassPageState extends State<LocalOutpassPage> {
  final TextEditingController _reasonController = TextEditingController();
  late String name = 'User'; // Fetch user's name from Firestore after login
  late String roomNumber = '101'; // Fetch user's room number from Firestore after login
  late String hostelName = 'Hostel A'; // Fetch user's hostel name from Firestore after login
  DateTime? _incomingTime;

  Future<void> _submitOutpass() async {
    final outpassData = {
      'name': name,
      'reason': _reasonController.text,
      'roomNumber': roomNumber,
      'hostelName': hostelName,
      'outTime': DateTime.now(),
      'incomingTime': _incomingTime ?? DateTime.now().add(Duration(hours: 12)), // Default to 7 PM if not set
    };

    try {
      await FirebaseFirestore.instance.collection('outpasses').add(outpassData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Outpass request submitted')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessPage()),
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
      appBar: AppBar(title: const Text('Local Outpass')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(labelText: 'Reason for Outpass'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOutpass,
              child: const Text('Submit Outpass Request'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
