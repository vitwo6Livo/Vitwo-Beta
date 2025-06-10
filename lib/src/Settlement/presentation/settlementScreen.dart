import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class settlementScreen extends StatefulWidget {
  const settlementScreen({super.key});

  @override
  State<settlementScreen> createState() => _settlementScreenState();
}

class _settlementScreenState extends State<settlementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            GlobalText.settlementTitle,
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: Center(child: Text('Settlement Screen')),
    );
  }
}
