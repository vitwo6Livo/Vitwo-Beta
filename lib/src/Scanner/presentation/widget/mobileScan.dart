import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class mobileScanner extends StatefulWidget {
  const mobileScanner({super.key});

  @override
  State<mobileScanner> createState() => _mobileScannerState();
}

class _mobileScannerState extends State<mobileScanner> {
  String? scannedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
          facing: CameraFacing.back,
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (BarcodeCapture barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;
            if (code != null && scannedData != code) {
              setState(() {
                scannedData = code;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Scanned: $code')));
              break;
            }
          }
        },
      ),
    );
  }
}
