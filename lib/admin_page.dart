import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('outpasses').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }

          final requests = snapshot.data!.docs;

          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return ListTile(
                title: Text(request['student_name']),
                subtitle: Text('Outpass Request: ${request['reason']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    // Approve the request
                    FirebaseFirestore.instance
                        .collection('outpasses')
                        .doc(request.id)
                        .update({'status': 'approved'});
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
