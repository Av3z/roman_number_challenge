import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  const CustomTextField(
      {super.key, required this.controller, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        style: const TextStyle(color: Colors.black87),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        controller: controller,
      ),
    );
  }
}
