import 'package:flutter/material.dart';

class InventoryView_StockTransfer extends StatefulWidget {
  const InventoryView_StockTransfer({super.key});

  @override
  State<InventoryView_StockTransfer> createState() =>
      _InventoryView_StockTransferState();
}

class _InventoryView_StockTransferState
    extends State<InventoryView_StockTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Stock Transfer Form'),
      ),
    );
  }
}
