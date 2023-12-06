import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputKeyboardType;
  final String hintText;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputKeyboardType,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the sytyling for the text feild
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputKeyboardType,
      obscureText: isPassword,
    );
  }
}
