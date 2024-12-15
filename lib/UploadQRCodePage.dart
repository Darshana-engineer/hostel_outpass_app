import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img; // For image processing
import 'package:zxing_lib/common.dart';
import 'package:zxing_lib/zxing.dart'; // ZXing for QR decoding

class UploadQRCodePage extends StatelessWidget {
  const UploadQRCodePage({Key? key}) : super(key: key);

  // Predefined entry code
  final String entryCode = "HostelEntry1234";

  Future<String?> decodeQRCode(Uint8List imageBytes) async {
    try {
      // Load image from bytes
      final img.Image? image = img.decodeImage(imageBytes);

      if (image == null) {
        throw Exception("Invalid image file");
      }

      // Convert image to luminance source
      final RGBLuminanceSource luminanceSource = RGBLuminanceSource(
        image.width,
        image.height,
        image.getBytes(format: img.Format.luminance),
      );

      // Decode QR code
      final BinaryBitmap bitmap = BinaryBitmap(HybridBinarizer(luminanceSource));
      final MultiFormatReader reader = MultiFormatReader();

      final Result result = reader.decode(bitmap);
      return result.text; // Return decoded QR code text
    } catch (e) {
      debugPrint("Error decoding QR code: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload QR Code"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Upload QR Code Image",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Let user pick an image file
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image, // Only allow image files
                  withData: true,      // Retrieve file as bytes
                );

                if (result != null) {
                  Uint8List? fileBytes = result.files.single.bytes;

                  if (fileBytes != null) {
                    String? qrCodeData = await decodeQRCode(fileBytes);

                    if (qrCodeData != null) {
                      if (qrCodeData == entryCode) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Welcome to Hostel!')),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid QR Code. Entry Denied.'),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to decode QR code.')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid file data.')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No file selected.')),
                  );
                }
              },
              child: const Text("Choose QR Code Image"),
            ),
          ],
        ),
      ),
    );
  }
}
