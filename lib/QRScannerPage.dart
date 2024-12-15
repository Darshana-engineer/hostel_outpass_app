import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'UploadQRCodePage.dart'; // Import the Upload QR Code Page

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  QRViewController? controller;
  String? scannedCode = "Waiting for QR scan..."; // Placeholder text for scanning status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // QR Scanner Widget
            SizedBox(
              height: 300,
              width: 300,
              child: QRView(
                key: GlobalKey(debugLabel: 'QR'),
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            const SizedBox(height: 20),

            // Display scanned data or error
            Text(
              scannedCode ?? "Scanning...",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Navigate to Upload QR Code Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadQRCodePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Upload QR Code",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // QR code scanning logic
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code; // Update the scanned code
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose(); // Dispose of the QR controller when not needed
    super.dispose();
  }
}
