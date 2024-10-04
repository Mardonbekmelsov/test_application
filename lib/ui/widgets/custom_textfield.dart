import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  String label;
  TextEditingController controller;
  bool obscureText = false;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
