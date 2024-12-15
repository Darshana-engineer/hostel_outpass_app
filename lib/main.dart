import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase options
import 'QRCodePage.dart';
import 'QRScannerPage.dart';
import 'local_pass.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'sign_up_page.dart';
import 'selection_page.dart';
import 'admin_page.dart';
import 'admin_database_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:qr_code_tools/qr_code_tools.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Outpass Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/selection', // Start with SelectionPage
      routes: {
        '/selection': (context) => const SelectionPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/localPass': (context) => const LocalPassPage(),
        '/admin': (context) => const AdminPage(),
        '/adminDatabase': (context) => const AdminDatabasePage(),
        '/qrScanner': (context) => const QRScannerPage(), // Ensure QRScannerPage is defined
        '/qrCode': (context) => const QRCodePage(), // QR code page for showing the QR
      },
    );
  }
}
