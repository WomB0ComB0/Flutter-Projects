import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/app_utils.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, required this.controller, required this.hintText, required this.icon, this.obscureText = false});

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        controller: controller,
        style: const TextStyle(
          color: colorWhite,
        ),
        textAlign: TextAlign.center,
        cursorColor: colorWhite,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(icon, color: colorWhite, size: 25.0),
          focusColor: colorWhite,
          hintText: hintText,
          hintStyle: const TextStyle(color: colorGrey, fontSize: 12.0),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorWhite),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorWhite),
          ),
          contentPadding: const EdgeInsets.only(top: 15.0),
        ),
      ),
    );
  }
}
