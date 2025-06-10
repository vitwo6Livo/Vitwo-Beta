import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Scanner/presentation/widget/mobileScan.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class scanScreen extends StatefulWidget {
  const scanScreen({super.key});

  @override
  State<scanScreen> createState() => _scanScreenState();
}

class _scanScreenState extends State<scanScreen> {
  String? scannedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            GlobalText.scanTitle,
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(style: BorderStyle.solid, width: 2.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mobileScanner()),
                    );
                  },
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    size: 200,
                    color: Color.fromARGB(255, 39, 90, 141),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
