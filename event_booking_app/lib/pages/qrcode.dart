import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:mobile_scanner/mobile_scanner.dart' hide BarcodeFormat;

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  String _qrResult = 'No QR scanned yet';
  bool _fromCamera = false;

  final ImagePicker _picker = ImagePicker();
  final BarcodeScanner _barcodeScanner =
      BarcodeScanner(formats: [BarcodeFormat.qrCode]);

  void _onDetect(BarcodeCapture capture) {
    if (!_fromCamera) return;

    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final value = barcodes.first.rawValue ?? '';

    if (value.isNotEmpty) {
      setState(() {
        _qrResult = value;
        _fromCamera = false;
      });
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? file =
          await _picker.pickImage(source: ImageSource.gallery);
      if (file == null) return;

      final inputImage = InputImage.fromFilePath(file.path);
      final barcodes = await _barcodeScanner.processImage(inputImage);

      if (barcodes.isEmpty) {
        setState(() {
          _qrResult = 'No QR code found in image.';
        });
        return;
      }

      final value = barcodes.first.rawValue ?? '';

      setState(() {
        _qrResult = value.isNotEmpty ? value : 'Unable to read QR.';
      });
    } catch (e) {
      setState(() {
        _qrResult = 'Error: $e';
      });
    }
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 235, 246, 249),
              Color.fromARGB(255, 87, 219, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
                    padding: EdgeInsets.only(top: 30.0,left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                        Text(
                          "Upload Event",
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 30, 27, 130),
                          ),
                        ),
                      ],
                    ),
                  ),
            Container(
              margin: const EdgeInsets.all(16),
              height: 260,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    MobileScanner(
                      onDetect: _onDetect,
                    ),
                    if (!_fromCamera)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            'Tap "Scan with Camera" to start',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _fromCamera = true;
              _qrResult = 'Scanning...';
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 23, 20, 97), 
            foregroundColor: Colors.white,                        
          ),
          icon: Icon(Icons.camera_alt),
          label: Text('Scan with Camera'),
        ),
        ElevatedButton.icon(
          onPressed: _pickFromGallery,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 23, 20, 97),
            foregroundColor: Colors.white,
          ),
          icon: Icon(Icons.photo_library),
          label: Text('From Gallery'),
        ),
            ],
          ),
        ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 20, 97),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _qrResult,
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}