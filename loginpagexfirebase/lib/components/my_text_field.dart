import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final controller;
  String text;
  bool hidden;
  MyTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.hidden
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
      child: TextField(
        obscureText: hidden,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
