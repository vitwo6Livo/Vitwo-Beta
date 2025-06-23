import 'package:flutter/material.dart';

class pp_BOM extends StatefulWidget {
  const pp_BOM({super.key});

  @override
  State<pp_BOM> createState() => _pp_BOMState();
}

class _pp_BOMState extends State<pp_BOM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bill of Materials'),
      ),
    );
  }
}
