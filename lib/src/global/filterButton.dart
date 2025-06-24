import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class filterButton extends StatelessWidget {
  const filterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: GlobalColor.OptionsColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.filter_alt, color: Colors.white),
    );
  }
}
