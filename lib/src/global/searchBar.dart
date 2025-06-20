import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;

  const SearchBarWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          cursorColor: GlobalColor.OptionsColor,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: GlobalColor.OptionsColor),
            hintText: 'Search...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: GlobalColor.OptionsColor, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: GlobalColor.OptionsColor, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
