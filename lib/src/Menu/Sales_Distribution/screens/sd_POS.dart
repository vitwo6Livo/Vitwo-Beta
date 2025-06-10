import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_POS extends StatefulWidget {
  const sd_POS({super.key});

  @override
  State<sd_POS> createState() => _sd_POSState();
}

class _sd_POSState extends State<sd_POS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_RFQ_PI,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
