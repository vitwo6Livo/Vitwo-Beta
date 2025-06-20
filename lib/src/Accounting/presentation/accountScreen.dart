import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class accountScreen extends StatefulWidget {
  const accountScreen({super.key});

  @override
  State<accountScreen> createState() => _accountScreenState();
}

class _accountScreenState extends State<accountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            GlobalText.accountTitle,
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: Center(child: Text('Accounting')),
    );
  }
}
