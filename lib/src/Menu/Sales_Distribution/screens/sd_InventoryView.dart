import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_InventoryView extends StatefulWidget {
  const sd_InventoryView({super.key});

  @override
  State<sd_InventoryView> createState() => _sd_InventoryViewState();
}

class _sd_InventoryViewState extends State<sd_InventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_InventoryView,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
